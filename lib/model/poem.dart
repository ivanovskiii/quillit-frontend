
import 'package:quillit_frontend/model/user.dart';

class Poem{
  final String id;
  final String title;
  final String content;
  final User author;
  final List<String> likedBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  Poem({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.likedBy,
    required this.createdAt,
    required this.updatedAt
  });

  factory Poem.fromJson(Map<String, dynamic> json) {
    return Poem(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
      likedBy: json['likedBy'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      '_id': id,
      'title': title,
      'content': author,
      'author': author,
      'likedBy': likedBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  } 
}