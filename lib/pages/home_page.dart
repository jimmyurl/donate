import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'donation_page.dart';
import 'past_donations_page.dart';
import 'charities_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  final List<Widget> _pages = [
    Center(
      child: Text(
        'Welcome to the Donation App!',
        style: TextStyle(fontSize: 24),
      ),
    ),
    DonationPage(),
    PastDonationsPage(),
    CharitiesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blue,
        items: [
          Icon(
            Icons.home,
            size: 30.0,
            color: activeIndex == 0 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            Icons.volunteer_activism,
            size: 30.0,
            color: activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            Icons.history,
            size: 30.0,
            color: activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            Icons.favorite,
            size: 30.0,
            color: activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB),
          ),
        ],
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0.0,
            top: -20.0,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                "assets/images/washing_machine_illustration.png", // Replace this with your asset
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kToolbarHeight),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Welcome Back,\n",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: "User!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/images/user.png", // Replace with your user image
                              height: 80,
                              width: 80,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 200.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            "New Locations",
                            style: TextStyle(
                              color: Color.fromRGBO(19, 22, 33, 1),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Container(
                          height: 100.0, // Adjust the height accordingly
                          child: Center(
                            child: Text(
                                "Location Slider Placeholder"), // Replace with your widget
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            "Latest Donations",
                            style: TextStyle(
                              color: Color.fromRGBO(19, 22, 33, 1),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 7.0),
                        // Add a widget here for the latest donations
                        Container(
                          height:
                              100.0, // Placeholder for your donations section
                          child: Center(
                            child: Text("Latest Donations Placeholder"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
