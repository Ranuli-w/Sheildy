import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> contactCards = [
  'Achchuweli - Police Station', 'Agalawaththa - Police Station', 'Agarapathana - Police Station',
  'Agbopura - Police Station', 'Ahangama - Police Station', 'Ahungalla - Police Station', 'Aiththamalai - Police Station',
  'Akkaraipattu - Police Station', 'Akkarayankulam - Police Station', 'Akmeemana - Police Station',
  'Akuressa - Police Station', 'Alawathugoda - Police Station', 'Alawwa - Police Station',
  'Angulana - Police Station', 'BMICH - Police Station', 'Bambalapitiya - Police Station', 'Borella - Police Station',
  'Boralesgamuwa - Police Station', 'Colombo Harbour - Police Station', 'Dematagoda - Police Station', 'Dehiwala - Police Station',
  'Dompe - Police Station', 'Kaduwela - Police Station', 'Kahathuduwa - Police Station', 'Kesbewa - Police Station',
  'Kiribathgoda - Police Station', 'Kollupitiya - Police Station', 'Kotahena - Police Station', 'Kohuwala - Police Station',
  'Malabe - Police Station', 'Maligawatta - Police Station', 'Maradana - Police Station', 'Mirihana - Police Station',
  'Moratuwa - Police Station', 'Mount Lavinia - Police Station', 'Narahenpita - Police Station', 'Nawagamuwa - Police Station',
  'Panadura North - Police Station', 'Pettah - Police Station', 'Piliyandala - Police Station', 'Sapugaskanda - Police Station',
  'Slave Island - Police Station', 'Thalangama - Police Station', 'Wellampitiya - Police Station', 'Wellawatta - Police Station',
  'Welikada - Police Station', 'Wolfendhal - Police Station',
  'Awissawella - Police Station', 'Mulleriyava - Police Station', 'Kosgama - Police Station', 'Padukka - Police Station',
  'Hanwella - Police Station', 'Mattegoda - Police Station', 'Cinnamon Garden - Police Station', 'Dam Street - Police Station',
  'Fore shore - Police Station', 'Grandpass - Police Station', 'Bluemandal - Police Station', 'Gothatuwa - Police Station',
  'Pugoda - Police Station', 'Meepe - Police Station','Dompe - Police Station', 'Kaduwela - Police Station', 'Kahathuduwa - Police Station', 'Kesbewa - Police Station',
  'Kiribathgoda - Police Station', 'Kollupitiya - Police Station', 'Kotahena - Police Station', 'Kohuwala - Police Station',
  'Malabe - Police Station', 'Maligawatta - Police Station', 'Maradana - Police Station', 'Mirihana - Police Station',
  'Moratuwa - Police Station', 'Mount Lavinia - Police Station', 'Narahenpita - Police Station', 'Nawagamuwa - Police Station',
  'Panadura North - Police Station', 'Pettah - Police Station', 'Piliyandala - Police Station', 'Sapugaskanda - Police Station',
  'Slave Island - Police Station', 'Thalangama - Police Station', 'Wellampitiya - Police Station', 'Wellawatta - Police Station',
  'Welikada - Police Station', 'Wolfendhal - Police Station',
  'Awissawella - Police Station', 'Mulleriyava - Police Station', 'Kosgama - Police Station', 'Padukka - Police Station',
  'Hanwella - Police Station', 'Mattegoda - Police Station', 'Cinnamon Garden - Police Station', 'Dam Street - Police Station',
  'Fore shore - Police Station', 'Grandpass - Police Station', 'Bluemandal - Police Station', 'Gothatuwa - Police Station',
  'Pugoda - Police Station', 'Meepe - Police Station'
];

  List<String> displayedCountries = [];
  @override
  void initState() {
    super.initState();
    displayedCountries = List.from(contactCards);
  }

  void onQueryChanged(String newQuery) {
    setState(() {
      if (newQuery.isEmpty) {
        displayedCountries = contactCards;
      } else {
        displayedCountries = contactCards
            .where((country) => country.toLowerCase().contains(newQuery.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SearchBar(onQueryChanged: onQueryChanged),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: displayedCountries.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(displayedCountries[index]),
          ),
        );
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onQueryChanged;

  SearchBar({required this.onQueryChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        onChanged: onQueryChanged,
        decoration: InputDecoration(
          labelText: 'Search from location',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
