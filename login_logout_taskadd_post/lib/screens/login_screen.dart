import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
bool _obscurePassword = true;
bool _isLoading = false;

@override
void dispose(){
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}

Future<void> _signIn() async {
  if (!_formKey.currentState!.validate()) return;

  setState(() => _isLoading = true);

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    // Navigation is handled by auth state listener in main.dart
  } on FirebaseAuthException catch (e) {
    String message;
    switch (e.code) {
      case 'user-not-found':
        message = 'No user found with this email.';
        break;
      case 'wrong-password':
        message = 'Wrong password provided.';
        break;
      case 'invalid-email':
        message = 'Invalid email address.';
        break;
      case 'user-disabled':
        message = 'This account has been disabled.';
        break;
      case 'invalid-credential':
        message = 'Invalid email or password.';
        break;
      default:
        message = e.message ?? 'An error occurred. Please try again.';
    }
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  } catch (e) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } finally {
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,

                  children: [
                    Icon(Icons.lock_outline, size: 80,),
                    SizedBox(height: 24,),

                    Text(
                      "Welcome back", style: TextStyle(fontWeight: .bold), textAlign: .center,
                    ),
                    SizedBox(height: 8,),

                    Text(
                      "Sing in to continue", style: TextStyle(color: Colors.grey),textAlign: .center,
                    ),
                    SizedBox(height: 32,),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: .next,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        hintText: "Enter your e-mail address",
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Please enter your email address";
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      textInputAction: .done,
                      onFieldSubmitted: (_) => _signIn,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: "Enter your password",
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                            icon : Icon(
                                _obscurePassword? Icons.visibility_outlined: Icons.visibility_off_outlined
                            ),
                            onPressed: (){
                              setState(() => _obscurePassword = !_obscurePassword);
                            }
                            ),
                        border: OutlineInputBorder()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),

                  // / Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                          child: TextButton(
                          onPressed: () {

                          },
                      child: const Text('Forgot Password?'),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Sign In Button
                    FilledButton(
                      onPressed: _isLoading ? null : _signIn,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                          : const Text('Sign In', style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 24),


                  ],
                ),
              ),
            ),
          )
      )
    );
  }
}
