import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education Initiatives',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildInitiativesList(),
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
          image: AssetImage('assets/images/education_hero.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          'Empower Through Education',
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

  Widget _buildInitiativesList() {
    final initiatives = [
      {
        'title': 'School Building Project',
        'description': 'Constructing schools in rural areas'
      },
      {
        'title': 'Teacher Training Program',
        'description': 'Upskilling educators for better learning outcomes'
      },
      {
        'title': 'Digital Literacy Campaign',
        'description': 'Bringing technology to underprivileged students'
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: initiatives.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(initiatives[index]['title']!,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
            subtitle: Text(initiatives[index]['description']!),
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

  Widget _buildDonationSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Make a Difference in Education',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your contribution can help provide quality education to those in need.',
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
