import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quillit_frontend/model/poem.dart';
import 'package:http/http.dart' as http;
import 'package:quillit_frontend/widgets/PoemWidget.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Poem>> poemsFuture = fetchPoems();

  static Future<List<Poem>> fetchPoems() async {
    final response = await http.get(Uri.parse('http://localhost:4000/poems'));

    if (response.statusCode == 200) {
      print("Response body: ${response.body}");
      final List<dynamic> data = json.decode(response.body);
      print("line");
      try {
        List<Poem> poems = data.map((poemData) => Poem.fromJson(poemData)).toList();
        return poems;
      } catch (e) {
        print("Error mapping poems: $e");
        return []; // Handle the error gracefully, e.g., return null
      }
    } else {
      throw Exception('Failed to fetch poems :(');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        child: Center(
          child: FutureBuilder<List<Poem>>(
            future: poemsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final poems = snapshot.data;

                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: poems?.length,
                  itemBuilder: (context, index) {
                    final poem = poems?[index];
                    return PoemWidget(poem!);
                  },
                );
              } else {
                return const Text("No poems to show :(");
              }
            },
          ),
        ),
      ),
    );
  }
}
