import 'package:flutter/material.dart';
import 'package:pet_care_app/services/pet_service.dart';

class CreateEditPetScreen extends StatefulWidget {
  final String? petId;
  final Map<String, dynamic>? petData;

  CreateEditPetScreen({Key? key, this.petId, this.petData}) : super(key: key);

  @override
  _CreateEditPetScreenState createState() => _CreateEditPetScreenState();
}

class _CreateEditPetScreenState extends State<CreateEditPetScreen> {
  final _petService = PetService();
  final _nameController = TextEditingController();
  final _breedController = TextEditingController();
  final _ageController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.petData != null) {
      _nameController.text = widget.petData!['name'];
      _breedController.text = widget.petData!['breed'];
      _ageController.text = widget.petData!['age'].toString();
      _descriptionController.text = widget.petData!['description'];
    }
  }

  Future<void> _savePetProfile() async {
    try {
      if (widget.petId == null) {
        await _petService.addPetProfile(
          _nameController.text,
          _breedController.text,
          int.parse(_ageController.text),
          _descriptionController.text,
        );
      } else {
        await _petService.updatePetProfile(widget.petId!, {
          'name': _nameController.text,
          'breed': _breedController.text,
          'age': int.parse(_ageController.text),
          'description': _descriptionController.text,
        });
      }
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.petId == null ? 'Create Pet Profile' : 'Edit Pet Profile'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: 'Pet Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _breedController,
              decoration: const InputDecoration(
                  labelText: 'Breed', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Age', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                  labelText: 'Description', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePetProfile,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
