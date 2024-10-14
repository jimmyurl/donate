// pages/login_page.dart
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          child: Text('Login'),
          onPressed: () {
            // In a real app, implement actual authentication here
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
    );
  }
}
