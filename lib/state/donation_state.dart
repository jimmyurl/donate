// lib/state/donation_state.dart
import 'package:flutter/foundation.dart';

class Donation {
  final String charity;
  final double amount;

  Donation({required this.charity, required this.amount});
}

class DonationState extends ChangeNotifier {
  List<Donation> _donations = [];

  List<Donation> get donations => _donations;

  void addDonation(Donation donation) {
    _donations.add(donation);
    notifyListeners();
  }

  double get totalDonations =>
      _donations.fold(0, (sum, donation) => sum + donation.amount);
}
