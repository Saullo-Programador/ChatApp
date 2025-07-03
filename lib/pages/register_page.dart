import 'package:flutter/material.dart';
import 'package:flutter_app/service/auth/auth_service.dart';
import 'package:flutter_app/components/my_button.dart';
import 'package:flutter_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {

  // Constructor
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final void Function() onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  //login method
  void register( BuildContext context) async{
    final _authService = AuthService();

    if(_passwordController.text == _confirmPasswordController.text) {
      try {
        await _authService.signUpWithEmailAndPassword(
          _emailController.text, 
          _passwordController.text
        );
      } catch (e) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text('sign up Failed'),
            content: Text('Error: $e'),
          )
        );
      }
    } else {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text('Password Mismatch'),
          
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
              "Let's create an account",
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

            //Confirm Password textfield
            MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 25),

            //Login button
            MyButton(
              text:'Register',
              onTap: () => register(context),
            ),

            const SizedBox(height: 25),

            //Sign up button
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now", 
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
