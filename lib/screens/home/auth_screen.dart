// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: use_key_in_widget_constructors
class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  void _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print("Login failed: $e");
    }
  }

  void _signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print("Signup failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                onChanged: (value) => email = value,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                onChanged: (value) => password = value,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true),
            ElevatedButton(onPressed: _signIn, child: const Text('Login')),
            ElevatedButton(onPressed: _signUp, child: const Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}
