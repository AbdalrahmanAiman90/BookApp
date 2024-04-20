import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookSearchPage extends StatefulWidget {
  @override
  _BookSearchPageState createState() => _BookSearchPageState();
}

class _BookSearchPageState extends State<BookSearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  Timer? _debounce;

  void _searchBooks(String query) async {
    // Cancel the previous debounce timer if it exists
    if (_debounce != null && _debounce!.isActive) {
      _debounce!.cancel();
    }

    // Set up a new debounce timer
    _debounce = Timer(
      Duration(milliseconds: 500),
      () async {
        String apiUrl =
            'YOUR_API_ENDPOINT?q=$query'; // Replace with your actual API endpoint
        var response = await http.get(Uri.parse(apiUrl));

        if (response.statusCode == 200) {
          setState(() {
            _searchResults = json.decode(response.body);
          });
        } else {
          // Handle error
          print('Failed to load data');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _searchBooks(value);
              },
              decoration: InputDecoration(
                hintText: 'Enter book name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index]['title']),
                  subtitle: Text(_searchResults[index]['author']),
                  // Add onTap to navigate or perform any other action
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookSearchPage(),
  ));
}
