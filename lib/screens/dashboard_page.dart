import 'package:flutter/material.dart';
import 'widgets/doctor_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctor Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Available Doctors:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          DoctorCard(name: 'Dr. Ayesha Rahman', specialty: 'Cardiologist'),
          DoctorCard(name: 'Dr. Hasan Ahmed', specialty: 'Dermatologist'),
          DoctorCard(name: 'Dr. Nilufa Sultana', specialty: 'Pediatrician'),
        ],
      ),
    );
  }
}
