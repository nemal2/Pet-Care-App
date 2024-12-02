import 'package:flutter/material.dart';

class PetFoodScreen extends StatelessWidget {
  const PetFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Food'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
        children: [
          _buildPetFoodItem(
            context,
            'Dog Food',
            'assets/static/food1.jpg',
            20.0,
          ),
          _buildPetFoodItem(
            context,
            'Cat Food',
            'assets/static/food2.jpg',
            18.0,
          ),
          _buildPetFoodItem(
            context,
            'Bird Food',
            'assets/static/food3.jpg',
            15.0,
          ),
        ],
      ),
    );
  }

  Widget _buildPetFoodItem(
      BuildContext context, String title, String imagePath, double price) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PetFoodDetailScreen(
            title: title,
            imagePath: imagePath,
            price: price,
            description: "$title with essential nutrients for pets.",
            contact: "Contact: +1 234 567 890",
            shopInfo: "Available at PetMart, HappyPets",
            discounts: "10% off on bulk purchase",
          ),
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$$price',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle add to cart
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetFoodDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final double price;
  final String description;
  final String shopInfo;
  final String contact;
  final String discounts;

  const PetFoodDetailScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.shopInfo,
    required this.contact,
    required this.discounts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle add to cart
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(imagePath, height: 250, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '\$$price',
                style: const TextStyle(fontSize: 20, color: Colors.green),
              ),
              const SizedBox(height: 8),
              const Text(
                "Available at:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(shopInfo),
              const SizedBox(height: 16),
              const Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(description),
              const SizedBox(height: 16),
              const Text(
                "Discounts",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(discounts),
              const SizedBox(height: 16),
              const Text(
                "Contact",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(contact),
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle contact option
                        },
                        icon: const Icon(Icons.message),
                        label: const Text('Contact'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle quick buy
                        },
                        icon: const Icon(Icons.shopping_bag),
                        label: const Text('Quick Buy'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle add to cart
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
