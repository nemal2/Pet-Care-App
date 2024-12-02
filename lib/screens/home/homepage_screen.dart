import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/home/healthrecord_screen.dart';
import 'package:pet_care_app/screens/home/petfood_screen.dart';
import 'package:pet_care_app/screens/home/petmarket_screen.dart';
import 'package:pet_care_app/screens/home/petprofile_screen.dart';
import 'package:pet_care_app/screens/home/userprofile_screen.dart';
import 'package:pet_care_app/screens/home/vetbooking_screen.dart';
import 'package:pet_care_app/screens/settings/settings_screen.dart';
import 'package:pet_care_app/services/pet_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  String? _selectedPetId;
  List<Map<String, dynamic>> _pets = [];
  final PetService _petService = PetService();

  @override
  void initState() {
    super.initState();
    _fetchPets();
  }

  Future<void> _fetchPets() async {
    try {
      final pets = await _petService.getPetProfiles();
      setState(() {
        _pets = pets;
        if (pets.isNotEmpty) {
          _selectedPetId = pets.first['id']; // Default to first pet
        }
      });
    } catch (e) {
      print('Error fetching pets: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Care Pro'),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8), // Adjusts position within the AppBar
            child: Container(
              height: kToolbarHeight -
                  16, // Matches AppBar height with margin adjustments
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 252, 244, 244),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: Colors.green, width: 1.5), // Subtle border
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedPetId,
                  hint: const Text(
                    'Select Pet',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  items: _pets.map((pet) {
                    return DropdownMenuItem<String>(
                      value: pet['id'] as String,
                      child: Text(
                        pet['name'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPetId = value;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.green,
                  ),
                  dropdownColor: Colors.white,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const VetBookingScreen(),
          const PetFoodScreen(),
          const PetMarketScreen(),
          PetProfileScreen(),
          if (_selectedPetId != null)
            PetHealthRecordScreen(
                key: ValueKey(_selectedPetId), petId: _selectedPetId!)
          else
            const Center(
                child: Text('Please select a pet to view health records')),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Vet Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Pet Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pet Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pet Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Health Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.green[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
