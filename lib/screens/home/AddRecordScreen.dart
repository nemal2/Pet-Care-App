// ignore: file_names
import 'package:flutter/material.dart';

class AddRecordScreen extends StatelessWidget {
  const AddRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final dateController = TextEditingController();
    final treatmentController = TextEditingController();
    final vetController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Record')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title')),
            TextField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Date')),
            TextField(
                controller: treatmentController,
                decoration: const InputDecoration(labelText: 'Treatment')),
            TextField(
                controller: vetController,
                decoration: const InputDecoration(labelText: 'Vet')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'title': titleController.text,
                  'date': dateController.text,
                  'treatment': treatmentController.text,
                  'vet': vetController.text,
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
