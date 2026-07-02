import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier{
  final AuthRepository _repository = AuthRepository();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String name, String password) async{
    isLoading = true;
    notifyListeners();

    final token = await _repository.login(name, password);

    if(token == null){
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token!);

      isLoading = false;
      notifyListeners();
      return true;
    }

    errorMessage = 'Invalid credential';
    isLoading = false;
    notifyListeners();
    return false;
  }
  Future<String?> getToken() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    notifyListeners();
  }
}