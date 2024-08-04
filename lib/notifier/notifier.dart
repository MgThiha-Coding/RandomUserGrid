import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:notifier/model/model.dart';

// Define the DataNotifier class
class DataNotifier extends Notifier<List<Users>> {
  @override
  List<Users> build() {
    fetchUsers(); // Asynchronous operation, consider handling loading/error state
    return [];
  }

  Future<void> fetchUsers() async {
    try {
      const uri = 'https://randomuser.me/api/?results=100';
      final url = Uri.parse(uri);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json['results'] as List<dynamic>;
        final transformed = result.map((e) {
          return Users(
            name: e['name']['first'],
            gender: e['gender'],
            email: e['email'],
            phone: e['phone'],
            country: e['location']['country'],
            image: e['picture']['thumbnail']
          );
        }).toList();

        // Update the state with the transformed data
        state = transformed;
      } else {
        // Handle error response
        throw Exception('Failed to load users');
      }
    } catch (e) {
      // Handle errors
      print('Error fetching users: $e');
      state = []; // Optionally set state to empty list or error state
    }
  }
}

// Correct the provider type to match the Notifier
final dataProvider = NotifierProvider<DataNotifier, List<Users>>(() {
  return DataNotifier();
});

// Correct the titleNotifier class
class TitleNotifier extends Notifier<String> {
  @override
  String build() {
    return 'Job Net'; // Default title
  }

  void updateTitle(String name) {
    state = name; // Update the title directly
  }
}

final titleProvider = NotifierProvider<TitleNotifier, String>(() {
  return TitleNotifier();
});
