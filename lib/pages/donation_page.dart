// pages/donation_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/donation_state.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _amount = 0;
  String _selectedCharity = 'Red Cross';

  List<String> charities = ['Red Cross', 'UNICEF', 'World Food Programme'];

  void _submitDonation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Simulate payment processing
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Processing Payment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Please wait...'),
            ],
          ),
        ),
      );

      // Simulate a network request
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Close the processing dialog

        // Add the donation to the state
        Provider.of<DonationState>(context, listen: false)
            .addDonation(Donation(charity: _selectedCharity, amount: _amount));

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Thank You!'),
            content: Text(
                '$_name, your donation of \$$_amount to $_selectedCharity has been received.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Return to previous page
                },
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donate')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Donation Amount (\$)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) => _amount = double.parse(value!),
              ),
              DropdownButtonFormField<String>(
                value: _selectedCharity,
                decoration: InputDecoration(labelText: 'Charity'),
                items: charities.map((String charity) {
                  return DropdownMenuItem<String>(
                    value: charity,
                    child: Text(charity),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCharity = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitDonation,
                child: Text('Donate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
