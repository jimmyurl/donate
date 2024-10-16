import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/education_page.dart';
import 'pages/healthcare_page.dart';
import 'pages/clean_water_page.dart';
import 'pages/conservation_page.dart';
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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    EducationPage(),
    HealthcarePage(),
    CleanWaterPage(),
    ConservationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openMapSearch() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nearby Donation Places'),
          content: Text('Map search functionality will be implemented here.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _openMapSearch,
        child: Icon(Icons.location_on),
        backgroundColor: Colors.pink[800],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: _selectedIndex == 0 ? Colors.pink[800] : Colors.grey,
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.school),
              color: _selectedIndex == 1 ? Colors.pink[800] : Colors.grey,
              onPressed: () => _onItemTapped(1),
            ),
            SizedBox(width: 40), // Space for the FAB
            IconButton(
              icon: Icon(Icons.local_hospital),
              color: _selectedIndex == 2 ? Colors.pink[800] : Colors.grey,
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.water_drop),
              color: _selectedIndex == 3 ? Colors.pink[800] : Colors.grey,
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(Icons.nature),
              color: _selectedIndex == 4 ? Colors.pink[800] : Colors.grey,
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
