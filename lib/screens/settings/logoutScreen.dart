import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Out'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Logout logic here
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text('Confirm Log Out'),
        ),
      ),
    );
  }
}
