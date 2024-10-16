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
      home: MainPage(), // MainPage now controls the bottom navigation
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
    Text('Charity Page'),
    Text('Donation Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define your action for the FAB here
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/icons/home.png'),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Image.asset('assets/icons/charity.png'),
              onPressed: () => _onItemTapped(1),
            ),
            SizedBox(width: 40), // Space for the FAB
            IconButton(
              icon: Image.asset('assets/icons/donation.png'),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Image.asset('assets/icons/profile.png'),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
