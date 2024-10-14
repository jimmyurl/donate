// pages/past_donations_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/donation_state.dart';

class PastDonationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Past Donations')),
      body: Consumer<DonationState>(
        builder: (context, donationState, child) {
          return ListView.builder(
            itemCount: donationState.donations.length,
            itemBuilder: (context, index) {
              final donation = donationState.donations[index];
              return ListTile(
                title: Text(
                    '${donation.charity}: \$${donation.amount.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Consumer<DonationState>(
        builder: (context, donationState, child) {
          return BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Donations: \$${donationState.totalDonations.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
