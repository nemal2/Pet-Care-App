import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/home/AddRecScreen.dart';
import 'package:pet_care_app/services/pet_service.dart';
import 'package:pet_care_app/services/vaccine_service.dart';

class PetHealthRecordScreen extends StatefulWidget {
  const PetHealthRecordScreen({super.key, required this.petId});

  final String petId;

  @override
  // ignore: library_private_types_in_public_api
  _PetHealthRecordScreenState createState() => _PetHealthRecordScreenState();
}

class _PetHealthRecordScreenState extends State<PetHealthRecordScreen> {
  final PetService _petService = PetService();
  final VaccineService _vaccineService = VaccineService();

  List<Map<String, dynamic>> _records = [];
  bool _isLoadingRecords = true;

  @override
  void initState() {
    super.initState();
    _fetchHealthRecords();
  }

  Future<void> _fetchHealthRecords() async {
    setState(() {
      _isLoadingRecords = true;
    });

    try {
      final records = await _vaccineService.getHealthRecords(widget.petId);
      setState(() {
        _records = records;
        _isLoadingRecords = false;
      });
    } catch (e) {
      print('Error fetching health records: $e');
      setState(() {
        _isLoadingRecords = false;
      });
    }
  }

  void _addNewRecord() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddRecordScreen(
          onRecordAdded: (newRecord) {
            setState(() {
              _records.insert(0, newRecord);
            });
          },
          petId: widget.petId,
        ),
      ),
    );

    // Trigger the health records refresh if a new record is added.
    if (result != null) {
      _fetchHealthRecords();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Health Records'),
        backgroundColor: const Color.fromARGB(255, 232, 235, 232),
      ),
      body: Column(
        children: [
          if (_isLoadingRecords)
            const Center(child: CircularProgressIndicator())
          else if (_records.isEmpty)
            const Center(child: Text('No records available'))
          else
            Expanded(
              child: ListView.builder(
                itemCount: _records.length,
                itemBuilder: (context, index) {
                  final record = _records[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: ListTile(
                      title: Text(record['title'] ?? 'Untitled Record'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${record['date'] ?? 'N/A'}'),
                          Text('Treatment: ${record['treatment'] ?? 'N/A'}'),
                          Text('Vet: ${record['vet'] ?? 'N/A'}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: _addNewRecord,
              icon: const Icon(Icons.add),
              label: const Text('Add New Record'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
