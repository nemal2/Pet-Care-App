import 'package:flutter/material.dart';
import 'package:pet_care_app/services/payment_service.dart';

class PaymentConnectionScreen extends StatelessWidget {
  PaymentConnectionScreen({super.key});

  final _paymentService = PaymentService();
  final _providerController = TextEditingController();
  final _cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userId = "currentUserId"; // Replace with actual user ID

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Connection'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _providerController,
              decoration: const InputDecoration(
                  labelText: 'Payment Provider', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Card Number', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _paymentService.savePaymentDetails(
                    userId,
                    _providerController.text,
                    _cardNumberController.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment details saved!')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Save Payment Details'),
            ),
          ],
        ),
      ),
    );
  }
}
