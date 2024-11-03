import 'package:flutter/material.dart';

class PaymentConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Connection'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Payment Connection Screen - Implement form here',
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
