import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CleanWaterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clean Water Projects',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildProjectsList(),
            _buildImpactSection(),
            _buildDonationSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/clean_water_hero.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          'Providing Clean Water for All',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildProjectsList() {
    final projects = [
      {
        'title': 'Well Drilling',
        'description': 'Creating new water sources in dry areas'
      },
      {
        'title': 'Water Filtration Systems',
        'description': 'Installing filters for safe drinking water'
      },
      {
        'title': 'Rainwater Harvesting',
        'description': 'Collecting and storing rainwater for communities'
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(projects[index]['title']!,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            subtitle: Text(projects[index]['description']!),
            trailing: ElevatedButton(
              child: Text('Support'),
              onPressed: () {
                // TODO: Implement support action
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildImpactSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Our Impact',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildImpactMetric('1M+', 'People Served'),
              _buildImpactMetric('5,000+', 'Projects Completed'),
              _buildImpactMetric('50+', 'Countries Reached'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImpactMetric(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
          ),
        ),
        Text(
          label,
          style: GoogleFonts.roboto(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildDonationSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Help Provide Clean Water',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your donation can help communities access clean, safe water.',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Donate Now'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            onPressed: () {
              // TODO: Implement donation action
            },
          ),
        ],
      ),
    );
  }
}
