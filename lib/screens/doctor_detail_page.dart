import 'package:flutter/material.dart';
import 'booking_confirmation.dart';

class DoctorDetailPage extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final String description;

  const DoctorDetailPage({
    super.key,
    required this.name,
    required this.specialty,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(image),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              specialty,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'About Doctor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => BookingConfirmation(
                            doctorName: name,
                            specialty: specialty,
                            dateTime: DateTime.now().add(
                              const Duration(days: 1),
                            ),
                          ),
                    ),
                  );
                },
                child: const Text('Book Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
