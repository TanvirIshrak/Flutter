import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../data/repositories/auth_repository.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name'),),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'),),

            SizedBox(height: 20,),
            viewModel.isLoading? CircularProgressIndicator() : ElevatedButton(
                onPressed: () async{
                  bool success = await viewModel.login(
                    nameController.text,
                    passwordController.text
                  );
                  if(success){
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                }, child: Text('login'),
            ),
            if(viewModel.errorMessage != null)
              Text(viewModel.errorMessage! , style: TextStyle(color: Colors.red,)),

          ],
        ),
      ),
    );
  }
}

