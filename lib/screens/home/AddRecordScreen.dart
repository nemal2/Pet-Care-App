import 'package:flutter/material.dart';

class AddRecordScreen extends StatelessWidget {
  const AddRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _dateController = TextEditingController();
    final _treatmentController = TextEditingController();
    final _vetController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Record')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title')),
            TextField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'Date')),
            TextField(
                controller: _treatmentController,
                decoration: const InputDecoration(labelText: 'Treatment')),
            TextField(
                controller: _vetController,
                decoration: const InputDecoration(labelText: 'Vet')),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'title': _titleController.text,
                  'date': _dateController.text,
                  'treatment': _treatmentController.text,
                  'vet': _vetController.text,
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
