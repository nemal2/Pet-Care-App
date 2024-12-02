import 'package:flutter/material.dart';

class AddRecordScreen extends StatefulWidget {
  final Map<String, dynamic>? initialData;
  final Function(Map<String, dynamic>) onRecordAdded;
  final Function(Map<String, dynamic>)? onRecordUpdated;

  const AddRecordScreen({
    this.initialData,
    required this.onRecordAdded,
    this.onRecordUpdated,
    Key? key,
  }) : super(key: key);

  @override
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
    _titleController =
        TextEditingController(text: widget.initialData?['title'] ?? '');
    _dateController =
        TextEditingController(text: widget.initialData?['date'] ?? '');
    _treatmentController =
        TextEditingController(text: widget.initialData?['treatment'] ?? '');
    _vetController =
        TextEditingController(text: widget.initialData?['vet'] ?? '');
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final record = {
        'title': _titleController.text,
        'status': widget.initialData == null
            ? 'Pending'
            : widget.initialData!['status'],
        'date': _dateController.text,
        'treatment': _treatmentController.text,
        'vet': _vetController.text,
      };

      if (widget.initialData == null) {
        widget.onRecordAdded(record);
      } else {
        widget.onRecordUpdated!(record);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.initialData == null ? 'Add New Record' : 'Edit Record'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a title' : null,
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a date' : null,
              ),
              TextFormField(
                controller: _treatmentController,
                decoration: InputDecoration(labelText: 'Treatment'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a treatment' : null,
              ),
              TextFormField(
                controller: _vetController,
                decoration: InputDecoration(labelText: 'Vet Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a vet name' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.initialData == null
                    ? 'Add Record'
                    : 'Update Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
