import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';
import 'widgets/profile_header.dart';
import 'widgets/info_card.dart';
//profile page

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppTheme.isDarkMode(context);
    final dateFormat = DateFormat('dd MMM yyyy');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(
              name: "John Doe",
              email: "john.doe@example.com",
              imagePath: "assets/profile.jpg",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InfoCard(
                    icon: Icons.person_outline,
                    title: "Personal Information",
                    items: {
                      "Phone": "+1 234 567 890",
                      "Address": "123 Medical St, Health City",
                      "Gender": "Male",
                      "Date of Birth": dateFormat.format(DateTime(1990, 5, 15)),
                    },
                  ),
                  const SizedBox(height: 16),
                  InfoCard(
                    icon: Icons.medical_services_outlined,
                    title: "Medical Information",
                    items: {
                      "Blood Type": "A+",
                      "Allergies": "Peanuts, Penicillin",
                      "Conditions": "None",
                      "Last Checkup": dateFormat.format(DateTime(2023, 10, 22)),
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Edit profile action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDark ? Colors.blueGrey : Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Logout action
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: isDark ? Colors.red[300]! : Colors.red,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 16,
                          color: isDark ? Colors.red[300] : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
