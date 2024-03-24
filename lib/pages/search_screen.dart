import 'package:flutter/material.dart';
import 'package:shieldy/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

//database connection- Read
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
      appBar: AppBar(
        backgroundColor:
            mobileBackgroundColor, // Ensure this color is defined or use a Color value directly
        centerTitle: false,
        title: Image.asset(
          'images/logo1.png',
          width: 100,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
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
        elevation: 4, // Add elevation for a shadow effect
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Add margin around the Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Add rounded corners to the Card
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16), // Add padding inside the ListTile
          leading: Icon(Icons.location_on, color: blueColor), // Add a leading icon
          title: Text(
            displayedCountries[index],
            style: TextStyle(
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 16, // Increase the font size
            ),
          ),
          subtitle: Text(
            'Police Station', // Add a subtitle
            style: TextStyle(color: Colors.grey), // Customize the subtitle style
          ),
          trailing: IconButton(
            icon: Icon(Icons.phone, color: const Color.fromARGB(255, 255, 255, 255)), // Add a trailing icon button
            onPressed: () {
            },
          ),
          onTap: () {
          },
        ),
      );
    },
  );
}


  // Widget _buildSearchResults() {
//   return Container(
//     color: Color.fromARGB(255, 0, 0, 0), // Change background color to black
//     margin: EdgeInsets.all(10), // Add margin around the search results
//     child: ListView.separated(
//       itemCount: displayedCountries.length,
//       separatorBuilder: (context, index) => Divider(color: Colors.white), // Add Divider between items
//       itemBuilder: (context, index) {
//         return Card(
//           color: Color.fromARGB(255, 0, 0, 0), // Set card background color to white
//           child: ListTile(
//             title: Text(
//               displayedCountries[index],
//               style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), // Set text color to black
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
}


class SearchBar extends StatelessWidget {
  final ValueChanged<String> onQueryChanged;

  SearchBar({required this.onQueryChanged});
  //searcch bar implementation

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
