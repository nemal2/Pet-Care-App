import 'package:flutter/material.dart';

class PetDetail extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const PetDetail({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagePath),
        Text(title),
        Text(description),
        Text('\$${price.toString()}'),
      ],
    );
  }
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Care App'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Other widgets...

          const PetDetail(
            imagePath: 'assets/images/pet.png',
            title: 'Cute Puppy',
            description: 'A very cute puppy',
            price: 120.0,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/petprofile');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('Manage Pet Profiles'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePageScreen(),
  ));
}
