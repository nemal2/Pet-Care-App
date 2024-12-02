import 'package:flutter/material.dart';
import 'package:pet_care_app/services/auth_service.dart';

class LogoutButton extends StatelessWidget {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _authService.signOut();
        Navigator.pushReplacementNamed(context, '/login');
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text('Log Out'),
    );
  }
}
