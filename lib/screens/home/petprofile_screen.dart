import 'package:flutter/material.dart';

class PetProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/onboarding/pet2.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Buddy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Golden Retriever',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Edit pet profile functionality here
              },
              icon: Icon(Icons.edit, color: Colors.white),
              label: Text('Edit Pet Profile'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.pets, color: Colors.teal),
              title: Text('Age'),
              subtitle: Text('3 years'),
            ),
            ListTile(
              leading: Icon(Icons.monitor_heart, color: Colors.teal),
              title: Text('Health Status'),
              subtitle: Text('Healthy'),
            ),
          ],
        ),
      ),
    );
  }
}
