
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// Remove the duplicate import statement for 'package:flutter/material.dart'
// import 'package:flutter/material.dart'; 



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(), // Using a separate widget for better structure
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Start with home as the selected tab

  static final List<Widget> _pages = [
    Icon(Icons.home), // Placeholder for Home
    Icon(Icons.map), // Placeholder for Map
    Icon(Icons.camera_alt), // Placeholder for Camera
    Icon(Icons.phone), // Placeholder for Phone
    Icon(Icons.settings), // Placeholder for Settings
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
        backgroundColor: Colors.red,
      ),
      body: _pages[_selectedIndex], // Display the selected tab content
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.camera_alt), label: 'Camera'),
          NavigationDestination(icon: Icon(Icons.phone), label: 'Phone'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}


