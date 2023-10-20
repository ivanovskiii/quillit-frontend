import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:quillit_frontend/screens/homeScreen.dart'; 
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quillit_frontend/screens/registerScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Define your server's URL for login
  final String loginUrl = 'http://localhost:4000/auth/login';

  Future<void> loginUser() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    try {

      final Map<String, String> requestBody = {
        'username': username,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      print(response.body);

      final responseBody = json.decode(response.body);

      if (response.body.contains("token")) {
        final token = responseBody['token'];
        print('Token: $token');

        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', token);
        print('Login successful');
        
        // Navigate to the main page after successful login
        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => HomeScreen()));
      } else {
        // Handle login error, such as showing an error message
        print('Login failed');
      }
    } catch (e) {
      // Handle network or other errors
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CupertinoTextField(
                controller: usernameController,
                placeholder: 'Username',
              ),
              const SizedBox(height: 16.0),
              CupertinoTextField(
                controller: passwordController,
                placeholder: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              CupertinoButton.filled(
                onPressed: loginUser,
                child: const Text('Login'),
              ),
              const SizedBox(height: 16.0),
              CupertinoButton.filled(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const RegisterScreen()));
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
