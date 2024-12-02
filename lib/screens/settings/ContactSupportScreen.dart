import 'package:flutter/material.dart';
import 'package:pet_care_app/services/support_service.dart';

class ContactSupportScreen extends StatelessWidget {
  ContactSupportScreen({super.key});

  final _supportService = SupportService();
  final _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userId = "currentUserId"; // Replace with actual user ID

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Support'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _queryController,
              maxLines: 5,
              decoration: const InputDecoration(
                  labelText: 'Your Query', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _supportService.submitQuery(
                      userId, _queryController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Query submitted!')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Submit Query'),
            ),
          ],
        ),
      ),
    );
  }
}
