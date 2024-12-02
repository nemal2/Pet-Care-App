import 'package:flutter/material.dart';
import 'package:pet_care_app/services/vaccine_service.dart';

class AddRecordScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onRecordAdded;
  final String petId;

  const AddRecordScreen({
    required this.onRecordAdded,
    required this.petId,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AddRecordScreenState createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _treatmentController;
  late TextEditingController _vetController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _dateController = TextEditingController();
    _treatmentController = TextEditingController();
    _vetController = TextEditingController();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final newRecord = {
        'title': _titleController.text,
        'date': _dateController.text,
        'treatment': _treatmentController.text,
        'vet': _vetController.text,
      };

      // Add the new record to the backend
      await VaccineService().addHealthRecord(widget.petId, newRecord);

      widget.onRecordAdded(
          newRecord); // Callback to update the UI on the PetHealthRecordScreen

      // ignore: use_build_context_synchronously
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _treatmentController.dispose();
    _vetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Health Record'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
                validator: (value) =>
                    value!.isEmpty ? 'Please select a date' : null,
              ),
              TextFormField(
                controller: _treatmentController,
                decoration: const InputDecoration(labelText: 'Treatment'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a treatment' : null,
              ),
              TextFormField(
                controller: _vetController,
                decoration: const InputDecoration(labelText: 'Vet Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a vet name' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Add Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
