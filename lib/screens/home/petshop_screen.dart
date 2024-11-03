import 'package:flutter/material.dart';
import 'pet_details_screen.dart';

class PetShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Shop'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _buildPetShopItem(context, 'Dog Food', 'assets/static/food1.jpg',
              20.0, 'High-quality dog food for your pet.'),
          _buildPetShopItem(context, 'Cat Toy', 'assets/onboarding/pet5.jpg',
              15.0, 'Fun and engaging toy for your cat.'),
          _buildPetShopItem(context, 'Bird Cage', 'assets/onboarding/pet3.jpg',
              50.0, 'Spacious cage for your pet bird.'),
        ],
      ),
    );
  }

  Widget _buildPetShopItem(BuildContext context, String title, String imagePath,
      double price, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PetDetailsScreen(
              title: title,
              imagePath: imagePath,
              description: description,
              price: 200,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: ListTile(
          leading: Image.asset(imagePath, height: 50),
          title: Text(title),
          subtitle: Text('\$$price'),
          trailing: Icon(Icons.info_outline),
        ),
      ),
    );
  }
}
