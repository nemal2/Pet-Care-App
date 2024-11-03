import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/settings/ContactSupportScreen.dart';
import 'package:pet_care_app/screens/settings/addUserScreen.dart';
import 'package:pet_care_app/screens/settings/changePasswordScreen.dart';
import 'package:pet_care_app/screens/settings/createPetProfileScreen.dart';
import 'package:pet_care_app/screens/settings/logoutScreen.dart';
import 'package:pet_care_app/screens/settings/paymentConnectionScreen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _buildSettingsItem(context, Icons.person_add, 'Add New User Account',
              AddUserScreen()),
          _buildSettingsItem(context, Icons.pets, 'Create New Pet Profile',
              CreatePetProfileScreen()),
          _buildSettingsItem(
              context, Icons.lock, 'Change Password', ChangePasswordScreen()),
          _buildSettingsItem(context, Icons.logout, 'Log Out', LogoutScreen()),
          _buildSettingsItem(context, Icons.payment, 'Payment Connection',
              PaymentConnectionScreen()),
          _buildSettingsItem(context, Icons.support, 'Contact Support',
              ContactSupportScreen()),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context, IconData icon, String title, Widget screen) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 30),
        title: Text(title, style: TextStyle(fontSize: 18)),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}