import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/home/AddRecScreen.dart';
import 'package:pet_care_app/services/vaccine_service.dart';

class PetHealthRecordScreen extends StatefulWidget {
  final String petId;

  const PetHealthRecordScreen({required this.petId, Key? key})
      : super(key: key);

  @override
  _PetHealthRecordScreenState createState() => _PetHealthRecordScreenState();
}

class _PetHealthRecordScreenState extends State<PetHealthRecordScreen> {
  final VaccineService _vaccineService = VaccineService();
  List<Map<String, dynamic>> _records = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchHealthRecords();
  }

  Future<void> _fetchHealthRecords() async {
    try {
      final records = await _vaccineService.getHealthRecords(widget.petId);
      setState(() {
        _records = records;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching records: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _addHealthRecord(Map<String, dynamic> newRecord) async {
    try {
      await _vaccineService.addHealthRecord(widget.petId, newRecord);
      _fetchHealthRecords();
    } catch (e) {
      print('Error adding record: $e');
    }
  }

  Future<void> _editHealthRecord(
      String recordId, Map<String, dynamic> updatedRecord) async {
    try {
      await _vaccineService.updateHealthRecord(
          widget.petId, recordId, updatedRecord);
      _fetchHealthRecords();
    } catch (e) {
      print('Error editing record: $e');
    }
  }

  void _navigateToAddEditRecordScreen({Map<String, dynamic>? record}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddRecordScreen(
          initialData: record,
          onRecordAdded: (newRecord) => _addHealthRecord(newRecord),
          onRecordUpdated: (updatedRecord) {
            if (record != null) {
              _editHealthRecord(record['id'], updatedRecord);
            }
          },
        ),
      ),
    );

    if (result != null) {
      _fetchHealthRecords();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Records'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _navigateToAddEditRecordScreen(),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _records.length,
              itemBuilder: (context, index) {
                final record = _records[index];
                return _buildHealthRecordItem(record);
              },
            ),
    );
  }

  Widget _buildHealthRecordItem(Map<String, dynamic> record) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        title: Text(record['title'] ?? 'Unknown'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: ${record['status'] ?? 'Unknown'}'),
            Text('Date: ${record['date'] ?? 'Unknown'}'),
            Text('Treatment: ${record['treatment'] ?? 'Unknown'}'),
            Text('Vet: ${record['vet'] ?? 'Unknown'}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit, color: Colors.blue),
          onPressed: () => _navigateToAddEditRecordScreen(record: record),
        ),
      ),
    );
  }
}
