import 'package:flutter/material.dart';
import 'package:flutter_app/service/auth/auth_service.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {

  // Constructor
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final void Function() onTap;

  LoginPage({
    super.key,
    required this.onTap,
  });

  //login method
  void login( BuildContext context) async{
    final _authService = AuthService();

    try{
      await _authService.signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      //ScaffoldMessenger.of(context).showSnackBar(
      //  SnackBar(content: Text('Login failed: $e')),
      //);
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          icon: Icon(Icons.error_outline_rounded, color: Colors.red),
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Icon(
              Icons.message,
              size: 80,
              color: Theme.of(context).colorScheme.onSurface,
            ),

            //Welcome message
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 25),
        
            //Email textfield
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 25),

            //Password textfield
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),

            const SizedBox(height: 25),

            //Login button
            MyButton(
              text:'Login',
              onTap: () => login(context),
            ),

            const SizedBox(height: 25),

            //Sign up button
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register now", 
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
