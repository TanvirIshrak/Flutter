import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_logout_taskadd_post/screens/login_screen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose(){
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // Create user account
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // Update display name
      await credential.user?.updateDisplayName(_nameController.text.trim());

      if (mounted) {
        // Pop back to login, auth state listener will handle navigation
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        Future.delayed(const Duration(seconds: 2),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
        });
      }
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'An account already exists with this email.';
          break;
        case 'invalid-email':
          message = 'Invalid email address.';
          break;
        case 'operation-not-allowed':
          message = 'Email/password accounts are not enabled.';
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
      appBar: AppBar(title: Text("Creat account"),),
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Icon(Icons.person_add_outlined, size: 80,),
                    SizedBox(height:8),

                    Text(
                      'Create Account', style: TextStyle(fontWeight: .bold), textAlign: .center,
                    ),
                    SizedBox(height: 8,),

                    Text(
                      'Fill in the details to create account', style: TextStyle(color:Colors.grey), textAlign: .center,
                    ),
                    SizedBox(height: 18,),

                    TextFormField(
                      controller: _nameController,
                      textInputAction: .next,
                      textCapitalization: .words,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter your full name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),


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
                      textInputAction: .next,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: "Create password",
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
                        if(value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),

                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      textInputAction: .done,
                      onFieldSubmitted: (_) => _register,
                      decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: "Re-enter your password",
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                              icon : Icon(
                                  _obscureConfirmPassword? Icons.visibility_outlined: Icons.visibility_off_outlined
                              ),
                              onPressed: (){
                                setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                              }
                          ),
                          border: OutlineInputBorder()
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if(value != _passwordController.text){
                          return "Password doesn't match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30,),
                    // register button
                    FilledButton(
                        onPressed: _isLoading? null : _register,
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 80)
                        ),
                        child: _isLoading? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                        ) : Text('Create Account', style: TextStyle(fontSize: 18),)
                    )

                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
