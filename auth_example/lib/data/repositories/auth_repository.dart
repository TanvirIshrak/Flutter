import 'package:auth_example/core/constrains/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../core/constrains/api_constants.dart';

class AuthRepository {
  Future<String?> login(String name, String password) async{
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.login),
      body: {
        'name' : name,
        'password': password,
      },
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data['token'];
    }
    return null;
  }
}