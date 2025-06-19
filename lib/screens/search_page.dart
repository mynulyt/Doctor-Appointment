import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'doctor_detail_page.dart';
import 'widgets/search_bar.dart';
import 'widgets/search_filter_chip.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _doctors = [
    {
      'name': 'Dr. Sarah Johnson',
      'specialty': 'Cardiologist',
      'rating': 4.9,
      'reviews': 128,
      'image': 'assets/doctor1.jpg',
      'description': 'Heart specialist with 12 years experience...',
    },
    {
      'name': 'Dr. Michael Chen',
      'specialty': 'Neurologist',
      'rating': 4.7,
      'reviews': 95,
      'image': 'assets/doctor2.jpg',
      'description': 'Expert in neurological disorders...',
    },
    {
      'name': 'Dr. Emily Wilson',
      'specialty': 'Pediatrician',
      'rating': 4.8,
      'reviews': 112,
      'image': 'assets/doctor3.jpg',
      'description': 'Child specialist with 8 years experience...',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Doctors'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBarWidget(controller: _searchController),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SearchFilterChip(
                  label: 'All',
                  selected: _selectedFilter == 'All',
                  onSelected: () => setState(() => _selectedFilter = 'All'),
                ),
                const SizedBox(width: 8),
                SearchFilterChip(
                  label: 'Cardiologist',
                  selected: _selectedFilter == 'Cardiologist',
                  onSelected:
                      () => setState(() => _selectedFilter = 'Cardiologist'),
                ),
                const SizedBox(width: 8),
                SearchFilterChip(
                  label: 'Neurologist',
                  selected: _selectedFilter == 'Neurologist',
                  onSelected:
                      () => setState(() => _selectedFilter = 'Neurologist'),
                ),
                const SizedBox(width: 8),
                SearchFilterChip(
                  label: 'Pediatrician',
                  selected: _selectedFilter == 'Pediatrician',
                  onSelected:
                      () => setState(() => _selectedFilter = 'Pediatrician'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _doctors.length,
              itemBuilder: (context, index) {
                final doctor = _doctors[index];
                return _buildDoctorCard(doctor, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(Map<String, dynamic> doctor, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => DoctorDetailPage(
                    name: doctor['name'],
                    specialty: doctor['specialty'],
                    image: doctor['image'],
                    description: doctor['description'],
                  ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(doctor['image']),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctor['specialty'],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          doctor['rating'].toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(${doctor['reviews']} reviews)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
