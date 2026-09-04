import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jamat_e_islami_books_store/Models/Data.dart';
import 'package:jamat_e_islami_books_store/components/AppBackButton.dart';
import 'package:jamat_e_islami_books_store/components/BookTile.dart';
import 'package:jamat_e_islami_books_store/config/bdapps.dart';
import 'package:jamat_e_islami_books_store/pages/AddNewBook/AddNewBook.dart';
import 'package:jamat_e_islami_books_store/pages/BookDetails/BookDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  // Cancels the BDApps subscription, wipes the local session, and routes
  // back to /login. The next time the user opens the app they will have
  // to re-subscribe by completing the OTP flow again.
  Future<void> _unsubscribe(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Unsubscribe?'),
        content: const Text(
          'You will lose access to the e-book catalogue. You can resubscribe anytime by logging in again.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, true),
            child: const Text(
              'Unsubscribe',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString('userPhone') ?? '';

    try {
      if (phone.isNotEmpty) {
        // Form-encoded because BDApps PHP reads $_POST — see comment in
        // LoginPage.dart for the full rationale.
        await http
            .post(
              Uri.parse('${bdappsBaseUrl}unsubscribe.php'),
              body: {'user_mobile': phone},
            )
            .timeout(const Duration(seconds: 15));
      }
    } catch (e) {
      // Backend ack failure shouldn't trap the user inside the app, so we
      // log the error and still clear the local session.
      debugPrint('Unsubscribe request failed: $e');
    }

    try {
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('userPhone');
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unsubscribe failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    if (!context.mounted) return;
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      '/login',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Pull the persisted phone number (saved on successful OTP verify) so
    // the header still shows who is signed in after Firebase was removed.
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snap) {
        final phone = snap.data?.getString('userPhone') ?? '';
        final displayName = phone.isNotEmpty ? phone : 'Guest reader';
        final email = phone.isNotEmpty ? 'Subscribed via BDApps' : 'Not signed in';

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewBook()),
              );
            },
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: AppBackButton(),
                                ),
                                Text(
                                  'Profile',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 80),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background,
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                height: 150,
                                width: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  // child: Image.asset(
                                  //   'Assets/Images/self.png',
                                  //   fit: BoxFit.cover,
                                  //   scale: 1.0,
                                  // ),
                                  child: Icon(Icons.person, size: 60,),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              displayName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                            ),
                            Text(
                              email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer
                                        .withOpacity(0.5),
                                  ),
                            ),
                            const SizedBox(height: 20),
                            OutlinedButton.icon(
                              onPressed: () => _unsubscribe(context),
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Unsubscribe',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white70),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Your Books ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Column(
                        children: bookData.map((e) => BookTile(
                              coverURL: e.bookurl!,
                              title: e.title!,
                              author: e.author!,
                              price: e.price!,
                              rating: e.rating!,
                              totalRating: e.numberOfRatings ?? 0,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookDetails(book: e),
                                  ),
                                );
                              },
                            )).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
