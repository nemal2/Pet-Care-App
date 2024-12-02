import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/home/healthrecord_screen.dart';
import 'package:pet_care_app/screens/home/petfood_screen.dart';
import 'package:pet_care_app/screens/home/petmarket_screen.dart';
import 'package:pet_care_app/screens/home/petprofile_screen.dart';
import 'package:pet_care_app/screens/home/userprofile_screen.dart';
import 'package:pet_care_app/screens/home/vetbooking_screen.dart';
import 'package:pet_care_app/screens/settings/settings_screen.dart';

class Homepage extends StatefulWidget {
  final String petId; // Add petId to pass to PetHealthRecordScreen

  const Homepage({required this.petId, Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0; // Adjust starting index as needed

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    // Initialize the widget options list here to use the petId
    _widgetOptions = <Widget>[
      const VetBookingScreen(),
      const PetFoodScreen(),
      PetHealthRecordScreen(petId: widget.petId), // Pass petId here
      const PetMarketScreen(),
      PetProfileScreen(),
      const SettingsScreen(),
    ];
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
        title: const Text('Pet Care Home'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
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
            icon: Icon(Icons.book),
            label: 'Health Records',
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
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.green[800],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 30,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
