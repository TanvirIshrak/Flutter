import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app_project/services/weather_services.dart';
import 'package:weather_app_project/widget/weather_card.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/weather_model.dart';

const String _baseUrl = "https://www.bdappsdigitalapps.com/NADB26025/";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherServices _weatherServices = WeatherServices();
  final TextEditingController _controller = TextEditingController();

  bool _isLoading = false;
  Weather? _weather;

  void _getWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weather = await _weatherServices.freatchWeather(_controller.text);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      // print(e);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));

      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _unsubscribe() async {
    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString('userPhone') ?? '';

    if (phone.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Phone not found!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    if (!mounted) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Unsubscribing'),
        content: const Text('Are you sure?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    if (!mounted) return;

    // Hold a reference to the loader dialog so we can reliably close it.
    bool loaderOpen = true;
    final loaderContext = context;
    showDialog<void>(
      context: loaderContext,
      barrierDismissible: false,
      builder: (dialogContext) => PopScope(
        canPop: false,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );

    Future<void> closeLoader() async {
      if (!loaderOpen) return;
      loaderOpen = false;
      if (!mounted) return;
      // Guard against pop when no dialog actually exists on the navigator.
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }

    try {
      final res = await http
          .post(
            Uri.parse('$_baseUrl/unsubscribe.php'),
            body: {'user_mobile': phone},
          )
          .timeout(const Duration(seconds: 15));

      if (!mounted) return;
      await closeLoader();

      if (res.statusCode != 200) {
        throw Exception('HTTP ${res.statusCode}');
      }

      final dynamic decoded = jsonDecode(res.body);
      if (decoded is! Map<String, dynamic>) {
        throw Exception('Unexpected response shape');
      }
      final data = decoded;
      final statusCode = data['statusCode']?.toString() ?? '';
      final statusDetail = data['statusDetail']?.toString() ?? '';
      final successFlag = data['success'] == true;
      final subscriptionStatus = (data['subscriptionStatus']?.toString() ?? '')
          .toUpperCase();

      final success =
          successFlag ||
          statusCode == 'S1000' ||
          subscriptionStatus == 'UNREGISTERED';

      if (success) {
        // Clear auth state before navigating so the cold-start guard in
        // main.dart doesn't read a stale `isLoggedIn` flag.
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', false);
        await prefs.remove('userPhone');

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unsubscribing success!'),
            backgroundColor: Colors.green,
          ),
        );

        // Use the named route already registered in main.dart — this avoids
        // building a new LoginPage widget ad-hoc and bypasses history quirks
        // that triggered `_history.isNotEmpty` assertion failures.
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil('/login', (route) => false);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              statusDetail.isNotEmpty ? statusDetail : 'Unsubscribing failed',
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } on TimeoutException {
      if (!mounted) return;
      await closeLoader();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Timeout error!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      await closeLoader();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Network error: $e'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            onPressed: () {
              _unsubscribe();
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Unsubscribe',
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient:
              (_weather != null &&
                  _weather!.description.toLowerCase().contains('rain'))
              ? const LinearGradient(
                  colors: [Colors.grey, Colors.blueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : (_weather != null &&
                    _weather!.description.toLowerCase().contains('clear'))
              ? const LinearGradient(
                  colors: [Color(0xFFFFB347), Color(0xFF4FC3F7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : (_weather != null &&
                    (_weather!.description.toLowerCase().contains('cloud') ||
                        _weather!.description.toLowerCase().contains(
                          'overcast',
                        )))
              ? const LinearGradient(
                  colors: [Color(0xFF757F9A), Color(0xFFD7DDE8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : (_weather != null &&
                    (_weather!.description.toLowerCase().contains('snow') ||
                        _weather!.description.toLowerCase().contains('cold')))
              ? const LinearGradient(
                  colors: [Color(0xFFB2FEFA), Color(0xFF0ED2F7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : (_weather != null &&
                    (_weather!.description.toLowerCase().contains('hot') ||
                        _weather!.description.toLowerCase().contains('warm')))
              ? const LinearGradient(
                  colors: [Color(0xFFFF512F), Color(0xFFF09819)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : const LinearGradient(
                  colors: [Color(0xFF89F7FE), Color(0xFF66A6FF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 25),
                Text(
                  "Weather App",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: .bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 25),
                TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'City',
                    hintText: 'Enter your city',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                ),
                SizedBox(height: 30),

                SizedBox(
                  height: 60,
                  width: 255,
                  child: ElevatedButton(
                    onPressed: _getWeather,
                    child: Text("Get weathe", style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.1),
                      foregroundColor: Colors.white.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(30),
                      ),
                    ),
                  ),
                ),

                if (_isLoading)
                  Padding(
                    padding: EdgeInsetsGeometry.all(20),
                    child: CircularProgressIndicator(color: Colors.white),
                  ),

                if (_weather != null) WeatherCard(weather: _weather!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
