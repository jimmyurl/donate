// pages/past_donations_page.dart
import 'package:flutter/material.dart';

class PastDonationsPage extends StatelessWidget {
  // In a real app, this would be fetched from a database or state management solution
  final List<String> donations = [
    'Red Cross: \$50',
    'UNICEF: \$75',
    'World Food Programme: \$100',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Past Donations')),
      body: ListView.builder(
        itemCount: donations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(donations[index]),
          );
        },
      ),
    );
  }
}
