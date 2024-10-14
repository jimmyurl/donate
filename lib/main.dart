// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/donation_page.dart';
import 'pages/past_donations_page.dart';
import 'pages/charities_page.dart';
import 'state/donation_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DonationState(),
      child: DonationApp(),
    ),
  );
}

class DonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
