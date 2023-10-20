import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quillit_frontend/screens/loginScreen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Define your server's URL for register
  final String registerUrl = 'http://localhost:4000/auth/register';

  Future<void> registerUser() async {
    final String name = nameController.text;
    final String lastName = lastNameController.text;
    final String email = emailController.text;
    final String username = usernameController.text;
    final String password = passwordController.text;

    print('Email: $email, Password: $password');

    try {

      final Map<String, String> requestBody = {
        "name": name,
        "lastName": lastName,
        "username": username,
        "email": email,
        "password": password
      };

      final response = await http.post(
        Uri.parse(registerUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      print(response.body);

      if (response.statusCode == 200) {
        // Successful register, handle the token or response here
        print('Regsiter successful');
        
        // Navigate to the main page after successful login
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const LoginScreen()));
      } else {
        // Handle login error, such as showing an error message
        print('Register failed');
      }
    } catch (e) {
      // Handle network or other errors
      print('An error occurred: $e');
    }
  }
  

@override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Create Account'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CupertinoTextField(
                controller: nameController,
                placeholder: 'Name',
              ),
              CupertinoTextField(
                controller: lastNameController,
                placeholder: 'Last Name',
              ),
              CupertinoTextField(
                controller: emailController,
                placeholder: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              CupertinoTextField(
                controller: usernameController,
                placeholder: 'Username',
              ),
              CupertinoTextField(
                controller: passwordController,
                placeholder: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              CupertinoButton.filled(
                onPressed: registerUser,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}