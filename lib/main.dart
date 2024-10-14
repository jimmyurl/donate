// main.dart
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/donation_page.dart';
import 'pages/past_donations_page.dart';
import 'pages/charities_page.dart';

void main() {
  runApp(DonationApp());
}

class DonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/donate': (context) => DonationPage(),
        '/past_donations': (context) => PastDonationsPage(),
        '/charities': (context) => CharitiesPage(),
      },
    );
  }
}
