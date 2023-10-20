import 'dart:convert';

import 'package:quillit_frontend/model/poem.dart';
import 'package:http/http.dart' as http;
import 'newPoemScreen.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<List<Poem>> fetchPoems() async{
    final response = await http.get(Uri.parse('http://localhost:4000/poems'));

    if(response.statusCode == 200){
      final List<dynamic> data = json.decode(response.body);
      List<Poem> poems = data.map((poemData) => Poem.fromJson(poemData)).toList();
      print(poems);
      return poems;
    } else {
      throw Exception('Failed to fetch poems :(');
    }
  }

  


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home Screen'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome to the Home Screen!'),
              CupertinoButton(
                onPressed: () {
                  // Show the NewPoemScreen as a modal dialog
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => NewPoemScreen(),
                  );
                },
                child: Text('Post New Poem'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
