import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int activeIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;
  String selectedLanguage = 'ENG'; // Language switcher state

  final List<Map<String, String>> currentCharities = [
    {
      "title": "Save the Oceans",
      "image": "assets/images/charity1.png",
      "impact": "10,000 lbs of plastic removed"
    },
    {
      "title": "Feed the Hungry",
      "image": "assets/images/charity2.jpg",
      "impact": "50,000 meals served"
    },
    {
      "title": "Educate Children",
      "image": "assets/images/charity3.jpg",
      "impact": "1,000 children enrolled"
    },
  ];

  final List<Map<String, String>> pastDonations = [
    {
      "title": "Clean Water Initiative",
      "image": "assets/images/donation1.png",
      "amount": "\$500"
    },
    {
      "title": "Reforestation Project",
      "image": "assets/images/donation2.jpg",
      "amount": "\$750"
    },
    {
      "title": "Animal Shelter Support",
      "image": "assets/images/donation3.jpg",
      "amount": "\$300"
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildCustomAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSize _buildCustomAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink[100]!, Colors.pink[200]!],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        title: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (_, child) {
              return Transform.rotate(
                angle: _animation.value * 2 * 3.14159,
                child: child,
              );
            },
            child: Image.asset('assets/icons/logob.png', height: 100),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.pink[50]!, Colors.white],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildLanguageSwitcher(), // Add language switcher here
            SizedBox(height: 10), // Space between switcher and hero section
            _buildHeroSection(),
            _buildFeaturedCharities(),
            _buildRecentDonations(),
            _buildImpactMetrics(),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSwitcher() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedLanguage = 'ENG';
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedLanguage == 'ENG'
                    ? Colors.pink[300]
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'ENG',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedLanguage == 'ENG'
                      ? Colors.white
                      : Colors.pink[800],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedLanguage = 'SW';
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedLanguage == 'SW'
                    ? Colors.pink[300]
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'SW',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: selectedLanguage == 'SW'
                      ? Colors.white
                      : Colors.pink[800],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Make a Difference Today',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.pink[800],
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your small act of kindness can change someone\'s world',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement donation action
            },
            child: Text('Donate Now'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink[400],
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedCharities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Featured Charities',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.pink[800],
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: currentCharities
              .map((charity) => _buildCharityCard(charity))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCharityCard(Map<String, String> charity) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(charity['image']!, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      charity['title']!,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      charity['impact']!,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentDonations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Recent Donations',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.pink[800],
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: pastDonations
              .map((donation) => _buildDonationCard(donation))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildDonationCard(Map<String, String> donation) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(donation['image']!, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      donation['title']!,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      donation['amount']!,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactMetrics() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildImpactMetric('Total Donations', '\$100,000'),
          _buildImpactMetric('Projects Funded', '50'),
          _buildImpactMetric('Volunteers', '200'),
        ],
      ),
    );
  }

  Widget _buildImpactMetric(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.pink[800],
          ),
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
