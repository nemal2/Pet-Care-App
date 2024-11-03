import 'package:flutter/material.dart';
import 'vetbooking_screen.dart';
import 'petfood_screen.dart';
import 'healthrecord_screen.dart';
import 'petmarket_screen.dart';
import 'userprofile_screen.dart';
import 'petprofile_screen.dart';
import 'settings/settings_screen.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0; // Adjust starting index as needed

  static final List<Widget> _widgetOptions = <Widget>[
    VetBookingScreen(),
    PetFoodScreen(),
    PetHealthRecordScreen(),
    PetMarketScreen(),
    PetProfileScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Care Home'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.person, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
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
