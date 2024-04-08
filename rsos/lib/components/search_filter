import 'dart:async'; // Import for StreamController
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> items = [
    'Apple',
    'Banana',
    'Orange',
    'Pineapple',
    // Add more items here
  ];

  final List<String> recentItems = [
    'Apple',
    'Banana',
    'Orange',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "null");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredItems = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredItems[index]),
          onTap: () {
            close(context, filteredItems[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final StreamController<List<String>> suggestionStream = StreamController<List<String>>(); // Defining StreamController
    final suggestionList = query.isEmpty
        ? recentItems // Display recent items when query is empty
        : items
            .where((item) =>
                item.toLowerCase().contains(query.toLowerCase()))
            .toList();
    suggestionStream.add(suggestionList);

    return StreamBuilder<List<String>>(
      stream: suggestionStream.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        final suggestions = snapshot.data!;
        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestions[index]),
              onTap: () {
                query = suggestions[index];
                showResults(context);
              },
            );
          },
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search items';
}
