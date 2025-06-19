import 'package:flutter/material.dart';

class BookingConfirmation extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final DateTime dateTime;

  const BookingConfirmation({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Appointment Booked!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Text('Doctor: $doctorName'),
            Text('Specialty: $specialty'),
            Text('Date: ${dateTime.day}/${dateTime.month}/${dateTime.year}'),
            Text('Time: ${dateTime.hour}:${dateTime.minute}'),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
