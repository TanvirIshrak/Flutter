import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmedPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmedPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text
      );
      await credential.user?? updateDisplayName(_nameController.text.trim());

      if(mounted){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account created successfully'),
          backgroundColor: Colors.green,
          ),

        );
      }
    } on FirebaseAuthException catch(e){
      String message;
      switch(e.code){
        case 'weak-password':
          message = 'The password provided is too weak';
          break;
        case 'email-already-in-use':
          message = 'An account already exists on this email';
          break;
        case 'invalid-email':
          message = 'Invalid email address';
          break;
        case 'operation-not-allowed':
          message = 'Email/Password accounts are not enabled';
          break;
        default:
          message = e.message ?? 'An error occured. Please try again.';
      }
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red,),
        );
      }
    }
    catch(e){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occured: $e'),
              backgroundColor: Colors.red,)
        );
      }
    }
    finally{
      if(mounted){
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Creat account'),),
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .stretch,
                    children: [
                      Icon(Icons.person_add_outlined,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(height: 24,),

                      Text(
                        'Creat Account',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.grey
                        ),
                        textAlign: .center,
                      ),
                      SizedBox(height: 32,),

                      TextFormField(
                        // now add controller to the top and call here
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: .next,
                        decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter you username',
                            // prefixIcon is to put the icon at the begining
                            prefixIcon: Icon(Icons.person_outlined),
                            border: OutlineInputBorder()
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),

                      TextFormField(
                        // now add controller to the top and call here
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: .next,
                        decoration: const InputDecoration(
                            labelText: 'E-mail',
                            hintText: 'Enter you email address',
                            // prefixIcon is to put the icon at the begining
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder()
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter your email';
                          }
                          if(!RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$').hasMatch(value)){
                            return 'Please enter your valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),

                      // Text field for password
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  // Used for the visibility icons to hide unhide password
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                  _obscurePassword? Icons.visibility_outlined: Icons.visibility_off_outlined
                              )
                          ),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter your password';
                          }
                          if(value.length <6){
                            return 'Password must be at lease 6 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16,),

                      TextFormField(
                        controller: _confirmedPasswordController,
                        obscureText: _obscureConfirmPassword,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _register(),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Re-enter your password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  // Used for the visibility icons to hide unhide password
                                  _obscureConfirmPassword = !_obscureConfirmPassword;
                                });
                              },
                              icon: Icon(
                                  _obscureConfirmPassword? Icons.visibility_outlined: Icons.visibility_off_outlined
                              )
                          ),
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please confirm your password';
                          }
                          if(value != _passwordController.text){
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24,),

                      FilledButton(
                          onPressed: _isLoading? null : _register,
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16)
                          ),
                          child: _isLoading? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ) : const Text('Creat Account', style: TextStyle(fontSize: 16),
                          )

                      ),
                      SizedBox(height: 24,),

                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(
                              onPressed:()=> Navigator.pop(context),
                              child: Text('Sign in'))
                        ],
                      )
                    ],
                  )

              ),
            ),
          )
      ),
    );
  }

  updateDisplayName(String trim) {}
}
