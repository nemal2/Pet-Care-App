import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/signup_screen.dart';
import 'screens/homepage_screen.dart';
import 'screens/petshop_screen.dart';
import 'screens/vetbooking_screen.dart';
import 'screens/petfood_screen.dart';
import 'screens/healthrecord_screen.dart';
import 'screens/petmarket_screen.dart';
import 'screens/userprofile_screen.dart';
import 'screens/petprofile_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/pet_details_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: const Color.fromARGB(255, 4, 0, 0)),
          bodyMedium: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/home': (context) => Homepage(),
        '/petshop': (context) => PetShopScreen(),
        '/vetbooking': (context) => VetBookingScreen(),
        '/petfood': (context) => PetFoodScreen(),
        '/healthrecord': (context) => PetHealthRecordScreen(),
        '/petmarket': (context) => PetMarketScreen(),
        '/userprofile': (context) => UserProfileScreen(),
        '/petprofile': (context) => PetProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/petdetails': (context) => PetDetailsScreen(
              title: 'Jhonny',
              imagePath: 'assets/onboarding/pet1.jpg',
              description: 'Jhonny is a friendly dog.',
              price: 200,
            ),
      },
    );
  }
}
