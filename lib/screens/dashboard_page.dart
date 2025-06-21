import 'package:doctor_appointment/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'doctor_detail_page.dart';

import 'widgets/doctor_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              // Toggle between light and dark mode
              final themeProvider = Theme.of(context);
              final newThemeMode =
                  themeProvider.brightness == Brightness.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
              // In a real app, you'd use a state management solution
              // This is simplified for demo purposes
              MaterialApp(themeMode: newThemeMode);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Available Doctors:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          DoctorCard(
            name: 'Dr. Ayesha Rahman',
            specialty: 'Cardiologist',
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => DoctorDetailPage(
                          name: 'Dr. Ayesha Rahman',
                          specialty: 'Cardiologist',
                          image: 'assets/doctor1.jpg', // Add your assets
                          description: '10 years experience in cardiology...',
                        ),
                  ),
                ),
          ),
          DoctorCard(
            name: 'Dr. Mynul Alam',
            specialty: 'Dermatologist',
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => DoctorDetailPage(
                          name: 'Dr. Mynul Alam',
                          specialty: 'Dermatologist',
                          image: 'assets/doctor2.jpg',
                          description: 'Specialized in skin treatments...',
                        ),
                  ),
                ),
          ),
          DoctorCard(
            name: 'Dr. Nilufa Sultana',
            specialty: 'Pediatrician',
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => DoctorDetailPage(
                          name: 'Dr. Nilufa Sultana',
                          specialty: 'Pediatrician',
                          image: 'assets/doctor3.jpg',
                          description:
                              'Child specialist with 8 years experience...',
                        ),
                  ),
                ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Add navigation logic here
        },
      ),
    );
  }
}
