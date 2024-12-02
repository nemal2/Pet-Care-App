import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/settings/createPetProfileScreen.dart';

import 'package:pet_care_app/services/pet_service.dart';

class PetProfileScreen extends StatefulWidget {
  @override
  _PetProfileScreenState createState() => _PetProfileScreenState();
}

class _PetProfileScreenState extends State<PetProfileScreen> {
  final PetService _petService = PetService();
  List<Map<String, dynamic>> _petProfiles = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPetProfiles();
  }

  Future<void> _fetchPetProfiles() async {
    try {
      final profiles = await _petService.getPetProfiles();
      setState(() {
        _petProfiles = profiles;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching pet profiles: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToCreateEditPetScreen([Map<String, dynamic>? petData]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateEditPetScreen(
          petId: petData?['id'],
          petData: petData,
        ),
      ),
    ).then((_) => _fetchPetProfiles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Profiles'),
        backgroundColor: Colors.green,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _petProfiles.length,
              itemBuilder: (context, index) {
                final pet = _petProfiles[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/onboarding/pet2.jpg'),
                    ),
                    title: Text(pet['name']),
                    subtitle: Text(pet['breed']),
                    trailing: IconButton(
                      icon: Icon(Icons.edit, color: Colors.teal),
                      onPressed: () => _navigateToCreateEditPetScreen(pet),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCreateEditPetScreen(),
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
