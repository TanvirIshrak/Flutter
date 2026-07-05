import 'package:auth_example_2/pages/resistration_screen.dart';
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
  bool _isLoading = false;
  bool _obscurePassword = true;

  Future<void> _signIn() async{
    if(!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text);
    }
    on FirebaseAuthException catch (e){
      String message;
      switch(e.code){
        case 'user-not-found':
          message = 'No user found with this email';
          break;
        case 'wrong-password':
          message = 'Wrong password provided';
          break;
        case 'invalid-email':
          message = 'Invalid Email address';
          break;
        case 'user-disabled':
          message = 'This account has been disabled';
          break;
        case 'invalid-credential':
          message = 'Invalid email or password';
          break;
        default:
          message = e.message?? 'An error occured . Please try again';
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
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

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
                    crossAxisAlignment: .stretch,
                    children: [
                      // Icon
                      Icon(
                        Icons.lock_outline,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                      ),

                      SizedBox(height: 24,),
                      Text(
                        'Welcome Back',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: .bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8,),

                      Text(
                        'Sign in to continue',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey
                        ),
                        textAlign: .center,
                      ),
                      SizedBox(height: 32,),

                      //Text field for email entering
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
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _signIn(),
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
                          return null;
                        },
                      ),
                      SizedBox(height: 8,),

                      // Forget button
                      Align(
                        alignment: .centerRight,
                        child:  TextButton(
                              onPressed: () => _showForgetPasswordDialog(),
                              child: const Text('Forget Password?')
                          ),
                      ),
                      SizedBox(height: 16,),

                      FilledButton(
                          onPressed: _isLoading? null : _signIn,
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
                          ) : const Text('Sign in', style: TextStyle(fontSize: 16),)

                      ),
                      SizedBox(height: 24,),

                      Row(
                        mainAxisAlignment: .center,
                        children: [
                          Text('Do not have an account?'),
                          TextButton(
                              onPressed:(){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context)=> RegisterPage()));
                              },
                              child: Text('Register'))
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

  void _showForgetPasswordDialog() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RegisterPage()));
  }
}
