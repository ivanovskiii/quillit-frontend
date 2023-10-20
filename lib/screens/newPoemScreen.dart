import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewPoemScreen extends StatefulWidget {
  @override
  _NewPoemScreenState createState() => _NewPoemScreenState();
}

class _NewPoemScreenState extends State<NewPoemScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  Future<void> createPoem(String title, String content) async {
  final Uri apiUrl = Uri.parse('http://localhost:4000/poems/post');

  final sharedPreferences = await SharedPreferences.getInstance();
  final String? token = sharedPreferences.getString('token');

  final Map<String, String> requestBody = {
    'title': title,
    'content': content,
  };

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token', // Include the token in the "Authorization" header
  };

  print(headers.values);

  final response = await http.post(
    apiUrl,
    headers: headers,
    body: jsonEncode(requestBody),
  );

  if (response.statusCode == 200) {
    // Poem posted successfully
    // You can handle the response here if needed
  } else {
    // Handle the error if the post request fails
  }
}


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Post New Poem'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoTextField(
                controller: titleController,
                placeholder: 'Title',
              ),
              CupertinoTextField(
                controller: contentController,
                placeholder: 'Content',
                maxLines: 5,
              ),
              CupertinoButton.filled(
                onPressed: () async {
                  final String title = titleController.text;
                  final String content = contentController.text;
                  await createPoem(title, content);

                  // Close the modal after posting the poem
                  Navigator.of(context).pop();
                },
                child: Text('Post Poem'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
