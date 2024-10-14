// pages/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: Text('Donate'),
              onTap: () => Navigator.pushNamed(context, '/donate'),
            ),
            ListTile(
              title: Text('Past Donations'),
              onTap: () => Navigator.pushNamed(context, '/past_donations'),
            ),
            ListTile(
              title: Text('Charities'),
              onTap: () => Navigator.pushNamed(context, '/charities'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Donation App!',
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
