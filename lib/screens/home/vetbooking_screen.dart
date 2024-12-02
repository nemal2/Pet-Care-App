import 'package:flutter/material.dart';

class VetBookingScreen extends StatelessWidget {
  const VetBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vet Booking'),
        backgroundColor: const Color.fromARGB(255, 232, 235, 232),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.85,
        children: [
          _buildVetBookingItem(
              context, 'Dr. John Doe', 'assets/static/vet1.jpg'),
          _buildVetBookingItem(
              context, 'Dr. Jane Smith', 'assets/static/vet2.jpg'),
          _buildVetBookingItem(
              context, 'Dr. Emma Brown', 'assets/static/vet3.jpg'),
        ],
      ),
    );
  }

  Widget _buildVetBookingItem(
      BuildContext context, String name, String imagePath) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VetDetailScreen(
            name: name,
            imagePath: imagePath,
            clinicImagePath: 'assets/static/clinic1.jpg',
            location: '123 Pet Care St, Petville',
            description: 'Experienced veterinarian specialized in small pets.',
            contact: 'Contact: +1 234 567 890',
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
                name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Veterinarian',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookingPage(name: name)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Book'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VetDetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final String clinicImagePath;
  final String location;
  final String description;
  final String contact;

  const VetDetailScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.clinicImagePath,
    required this.location,
    required this.description,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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
                name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Location:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(location,
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(clinicImagePath,
                    height: 150, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              const Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(description),
              const SizedBox(height: 16),
              const Text(
                "Contact",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(contact),
              const SizedBox(height: 30),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingPage(name: name)),
                      );
                    },
                    icon: const Icon(Icons.book_online),
                    label: const Text('Quick Book'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
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

class BookingPage extends StatelessWidget {
  final String name;

  const BookingPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment with $name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Select Date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Date Picker Widget here
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Select Date"),
              onTap: () {
                // Open date picker
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Available Slots",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 10,
              children: [
                Chip(label: Text("10:00 AM")),
                Chip(label: Text("11:30 AM")),
                Chip(label: Text("1:00 PM")),
                Chip(label: Text("2:30 PM")),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Booking Charges",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("\$50 per consultation"),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle final booking confirmation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
