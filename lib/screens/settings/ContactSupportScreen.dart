import 'package:flutter/material.dart';

class ContactSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Support'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Contact Support Screen - Implement form here',
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
