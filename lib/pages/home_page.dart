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
    )..repeat(reverse: true);
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
      bottomNavigationBar: _buildCustomBottomNavBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSize _buildCustomAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.0),
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/icons/logob.png', height: 40),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_avatar.png'),
            ),
          ],
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
            SizedBox(height: 100),
            _buildHeroSection(),
            _buildFeaturedCharities(),
            _buildRecentDonations(),
            _buildImpactMetrics(),
          ],
        ),
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
            'Your Recent Donations',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.pink[800],
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pastDonations.length,
            itemBuilder: (context, index) {
              return _buildDonationCard(pastDonations[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDonationCard(Map<String, String> donation) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                donation['image']!,
                height: 70,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    donation['title']!,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    donation['amount']!,
                    style: GoogleFonts.roboto(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactMetrics() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Impact',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.pink[800],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildImpactCard(
                  'Total Donated', '\$1,550', Icons.monetization_on),
              _buildImpactCard('Lives Impacted', '1,230', Icons.people),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImpactCard(String title, String value, IconData icon) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.pink[400]),
            SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home,
                  color: activeIndex == 0 ? Colors.pink[400] : Colors.grey),
              onPressed: () => setState(() => activeIndex = 0),
            ),
            IconButton(
              icon: Icon(Icons.search,
                  color: activeIndex == 1 ? Colors.pink[400] : Colors.grey),
              onPressed: () => setState(() => activeIndex = 1),
            ),
            SizedBox(width: 40), // The dummy child
            IconButton(
              icon: Icon(Icons.favorite,
                  color: activeIndex == 2 ? Colors.pink[400] : Colors.grey),
              onPressed: () => setState(() => activeIndex = 2),
            ),
            IconButton(
              icon: Icon(Icons.person,
                  color: activeIndex == 3 ? Colors.pink[400] : Colors.grey),
              onPressed: () => setState(() => activeIndex = 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, child) {
          return Transform.rotate(
            angle: _animation.value * 2 * 3.14159,
            child: child,
          );
        },
        child: Icon(Icons.add),
      ),
      onPressed: () {
        // TODO: Implement quick donation action
      },
      backgroundColor: Colors.pink[400],
    );
  }
}
