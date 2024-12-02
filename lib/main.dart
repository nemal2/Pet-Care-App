import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/home/healthrecord_screen.dart';
import 'package:pet_care_app/screens/home/homepage_screen.dart';
import 'package:pet_care_app/screens/home/pet_details_screen.dart';
import 'package:pet_care_app/screens/home/petfood_screen.dart';
import 'package:pet_care_app/screens/home/petmarket_screen.dart';
import 'package:pet_care_app/screens/home/petprofile_screen.dart';
import 'package:pet_care_app/screens/home/petshop_screen.dart';
import 'package:pet_care_app/screens/home/userprofile_screen.dart';
import 'package:pet_care_app/screens/home/vetbooking_screen.dart';
import 'package:pet_care_app/screens/home/welcome_screen.dart';
import 'package:pet_care_app/screens/settings/settings_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => const OnboardingScreen());
          case '/login':
            return MaterialPageRoute(builder: (context) => const LoginScreen());
          case '/signup':
            return MaterialPageRoute(
                builder: (context) => const SignupScreen());
          case '/home':
            return MaterialPageRoute(
              builder: (context) => Homepage(
                  petId: 'default-pet-id'), // Pass a default petId here
            );
          case '/welcome':
            return MaterialPageRoute(builder: (context) => WelcomeScreen());
          case '/petprofile':
            return MaterialPageRoute(builder: (context) => PetProfileScreen());
          case '/petshop':
            return MaterialPageRoute(
                builder: (context) => const PetShopScreen());
          case '/vetbooking':
            return MaterialPageRoute(builder: (context) => VetBookingScreen());
          case '/petfood':
            return MaterialPageRoute(builder: (context) => PetFoodScreen());
          case '/healthrecord':
            if (settings.arguments != null && settings.arguments is String) {
              final petId = settings.arguments as String;
              return MaterialPageRoute(
                builder: (context) => PetHealthRecordScreen(petId: petId),
              );
            } else {
              // Handle the case where petId is not provided
              return MaterialPageRoute(
                builder: (context) => const Scaffold(
                  body: Center(
                    child: Text('Pet ID is required to access health records.'),
                  ),
                ),
              );
            }
          case '/userprofile':
            return MaterialPageRoute(builder: (context) => UserProfileScreen());
          case '/settings':
            return MaterialPageRoute(builder: (context) => SettingsScreen());
          case '/petmarket':
            return MaterialPageRoute(builder: (context) => PetMarketScreen());
          case '/petdetails':
            if (settings.arguments != null &&
                settings.arguments is Map<String, dynamic>) {
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                builder: (context) {
                  return PetDetailsScreen(
                    title: args['title'],
                    imagePath: args['imagePath'],
                    description: args['description'],
                    price: args['price'],
                  );
                },
              );
            } else {
              // Handle the case where arguments are not provided or are incorrect
              return MaterialPageRoute(
                  builder: (context) => Homepage(petId: 'default-pet-id'));
            }
          default:
            return null;
        }
      },
    );
  }
}
