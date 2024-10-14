import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
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
      home: HomePage(), // Use HomePage as the default route
    );
  }
}
