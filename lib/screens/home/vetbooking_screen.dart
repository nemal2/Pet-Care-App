import 'package:flutter/material.dart';

class VetBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vet Booking'),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(10),
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Veterinarian',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(height: 5),
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
                child: Text('Book'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
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

class VetDetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final String clinicImagePath;
  final String location;
  final String description;
  final String contact;

  VetDetailScreen({
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
              SizedBox(height: 16),
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Location:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(location,
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(clinicImagePath,
                    height: 150, fit: BoxFit.cover),
              ),
              SizedBox(height: 16),
              Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(description),
              SizedBox(height: 16),
              Text(
                "Contact",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(contact),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle contact option
                    },
                    icon: Icon(Icons.message),
                    label: Text('Contact'),
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
                    icon: Icon(Icons.book_online),
                    label: Text('Quick Book'),
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

  BookingPage({required this.name});

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
            Text(
              "Select Date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Date Picker Widget here
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Select Date"),
              onTap: () {
                // Open date picker
              },
            ),
            SizedBox(height: 20),
            Text(
              "Available Slots",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                Chip(label: Text("10:00 AM")),
                Chip(label: Text("11:30 AM")),
                Chip(label: Text("1:00 PM")),
                Chip(label: Text("2:30 PM")),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Booking Charges",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("\$50 per consultation"),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle final booking confirmation
              },
              child: Text('Confirm Booking'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
