import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TanzaniaRegionsPage extends StatefulWidget {
  const TanzaniaRegionsPage({super.key});

  @override
  State<TanzaniaRegionsPage> createState() => _TanzaniaRegionsPageState();
}

class _TanzaniaRegionsPageState extends State<TanzaniaRegionsPage> {
  String? selectedRegion;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tanzania Regions'),
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveTanzaniaMap(
              selectedRegion: selectedRegion,
              onRegionSelected: (code) {
                setState(() {
                  selectedRegion = code;
                  controller.text = tanzaniaRegions[code] ?? 'Unknown Region';
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              readOnly: true,
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Selected Region",
              ),
              onTap: () async {
                final value = await showModalBottomSheet<String>(
                  context: context,
                  builder: (context) => const TanzaniaRegionsList(),
                );
                if (value != null) {
                  controller.text = tanzaniaRegions[value] ?? 'Unknown Region';
                  setState(() {
                    selectedRegion = value;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class InteractiveTanzaniaMap extends StatelessWidget {
  final String? selectedRegion;
  final Function(String) onRegionSelected;

  const InteractiveTanzaniaMap({
    Key? key,
    this.selectedRegion,
    required this.onRegionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/tanzania_map.svg',
      semanticsLabel: 'Tanzania Map',
      fit: BoxFit.contain,
    );
  }
}

class TanzaniaRegionsList extends StatelessWidget {
  const TanzaniaRegionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = tanzaniaRegions.entries.toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final region = entries[index];
        return ListTile(
          title: Text(region.value),
          onTap: () {
            Navigator.of(context).pop(region.key);
          },
        );
      },
    );
  }
}

// Map of Tanzania regions
final Map<String, String> tanzaniaRegions = {
  'TZ-01': 'Arusha',
  'TZ-02': 'Dar es Salaam',
  'TZ-03': 'Dodoma',
  'TZ-04': 'Iringa',
  'TZ-05': 'Kagera',
  // Add more regions as needed
};
