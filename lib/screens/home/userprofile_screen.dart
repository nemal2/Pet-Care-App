import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/static/user.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Edit profile functionality here
              },
              icon: Icon(Icons.edit, color: Colors.white),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.teal),
              title: Text('Phone Number'),
              subtitle: Text('+123 456 7890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.teal),
              title: Text('Address'),
              subtitle: Text('123 Main St, City, Country'),
            ),
          ],
        ),
      ),
    );
  }
}
