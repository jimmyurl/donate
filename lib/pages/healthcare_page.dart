import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthcarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthcare Initiatives',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildInitiativesList(),
            _buildStatisticsSection(),
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
          image: AssetImage('assets/images/healthcare_hero.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          'Healing Communities, Saving Lives',
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
        'title': 'Mobile Clinics',
        'description': 'Bringing healthcare to remote areas'
      },
      {
        'title': 'Vaccination Drives',
        'description': 'Immunizing communities against preventable diseases'
      },
      {
        'title': 'Maternal Health Program',
        'description': 'Supporting expectant mothers and newborns'
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

  Widget _buildStatisticsSection() {
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
              _buildStatistic('500K+', 'Patients Treated'),
              _buildStatistic('1000+', 'Healthcare Workers Trained'),
              _buildStatistic('100+', 'Clinics Established'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.pink[800],
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
            'Support Healthcare Initiatives',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Your contribution can help provide essential healthcare services to those in need.',
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
