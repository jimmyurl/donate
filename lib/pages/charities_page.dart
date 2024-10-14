// pages/charities_page.dart
import 'package:flutter/material.dart';

class CharitiesPage extends StatelessWidget {
  final List<Map<String, String>> charities = [
    {
      'name': 'Red Cross',
      'description':
          'Provides emergency assistance, disaster relief, and disaster preparedness education.',
    },
    {
      'name': 'UNICEF',
      'description':
          'Works in over 190 countries and territories to save childrens lives, to defend their rights, and to help them fulfill their potential.',
    },
    {
      'name': 'World Food Programme',
      'description':
          'The worlds largest humanitarian organization addressing hunger and promoting food security.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Charities')),
      body: ListView.builder(
        itemCount: charities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(charities[index]['name']!),
            subtitle: Text(charities[index]['description']!),
          );
        },
      ),
    );
  }
}
