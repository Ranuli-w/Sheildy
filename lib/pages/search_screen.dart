import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> contactCards = [
  
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
