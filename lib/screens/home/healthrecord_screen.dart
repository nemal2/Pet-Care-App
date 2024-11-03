import 'package:flutter/material.dart';

class PetHealthRecordScreen extends StatefulWidget {
  @override
  _PetHealthRecordScreenState createState() => _PetHealthRecordScreenState();
}

class _PetHealthRecordScreenState extends State<PetHealthRecordScreen> {
  List<Map<String, String>> records = [
    {
      'title': 'Vaccination',
      'imagePath': 'assets/onboarding/pet1.jpg',
      'status': 'Completed',
      'date': '2024-10-01',
      'treatment': 'Rabies Vaccination',
      'vet': 'Dr. Smith',
    },
    {
      'title': 'Deworming',
      'imagePath': 'assets/onboarding/pet2.jpg',
      'status': 'Due in 2 weeks',
      'date': '2024-11-15',
      'treatment': 'Deworming',
      'vet': 'Dr. Johnson',
    },
    {
      'title': 'Regular Checkup',
      'imagePath': 'assets/onboarding/pet3.jpg',
      'status': 'Completed',
      'date': '2024-09-10',
      'treatment': 'General Checkup',
      'vet': 'Dr. Lee',
    },
  ];

  void _navigateToAddRecordScreen(BuildContext context) async {
    final newRecord = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddRecordScreen(),
      ),
    );

    if (newRecord != null) {
      setState(() {
        records.add(newRecord);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Vaccination Book'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _navigateToAddRecordScreen(context),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return _buildHealthRecordItem(
            record['title']!,
            record['imagePath']!,
            record['status']!,
            record['date']!,
            record['treatment']!,
            record['vet']!,
          );
        },
      ),
    );
  }

  Widget _buildHealthRecordItem(String title, String imagePath, String status,
      String date, String treatment, String vet) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              Image.asset(imagePath, height: 50, width: 50, fit: BoxFit.cover),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(status, style: TextStyle(color: Colors.green)),
            Text('Date: $date'),
            Text('Treatment: $treatment'),
            Text('Vet: $vet'),
          ],
        ),
      ),
    );
  }
}

class AddRecordScreen extends StatefulWidget {
  @override
  _AddRecordScreenState createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _treatmentController = TextEditingController();
  final _vetController = TextEditingController();

  void _submitRecord() {
    if (_titleController.text.isEmpty ||
        _dateController.text.isEmpty ||
        _treatmentController.text.isEmpty ||
        _vetController.text.isEmpty) {
      return;
    }

    final newRecord = {
      'title': _titleController.text,
      'imagePath':
          'assets/onboarding/pet1.jpg', // Add image selection logic here
      'status': 'Pending',
      'date': _dateController.text,
      'treatment': _treatmentController.text,
      'vet': _vetController.text,
    };

    Navigator.of(context).pop(newRecord);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Record'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Record Title'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
            ),
            TextField(
              controller: _treatmentController,
              decoration: InputDecoration(labelText: 'Treatment'),
            ),
            TextField(
              controller: _vetController,
              decoration: InputDecoration(labelText: 'Vet Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRecord,
              child: Text('Add Record'),
            ),
          ],
        ),
      ),
    );
  }
}
