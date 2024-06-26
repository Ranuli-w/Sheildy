/*import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseFirestore.instance.settings;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Directory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhoneDirectory(),
    );
  }
}

class PhoneDirectory extends StatefulWidget {
  @override
  _PhoneDirectoryState createState() => _PhoneDirectoryState();
}

class _PhoneDirectoryState extends State<PhoneDirectory> {
  final TextEditingController _searchController = TextEditingController();
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('phoneNumbers').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Directory'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                // Implement search functionality here
                setState(() {
                  _stream = FirebaseFirestore.instance
                      .collection('phoneNumbers')
                      .where('name', isGreaterThanOrEqualTo: value)
                      .where('name', isLessThan: value + 'z')
                      .snapshots();
                });
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                var phoneNumbers = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: phoneNumbers.length,
                  itemBuilder: (context, index) {
                    var phoneNumber = phoneNumbers[index].data() as Map;
                    return ListTile(
                      title: Text(phoneNumber['name']),
                      subtitle: Text(phoneNumber['number']),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}*/
