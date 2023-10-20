class Poem{
  final String id;
  final String title;
  final String content;
  final String authorId;
  final List<String> likedBy;
  final String createdAt;
  final String updatedAt;

  Poem({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    required this.likedBy,
    required this.createdAt,
    required this.updatedAt
  });

  factory Poem.fromJson(Map<String, dynamic> json) {
    final List<dynamic> likedByList = json['likedBy'];
    final List<String> likedBy = likedByList.map((like) => like.toString()).toList();  

    return Poem(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      authorId: json['author'],
      likedBy: likedBy,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      '_id': id,
      'title': title,
      'content': authorId,
      'author': authorId,
      'likedBy': likedBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  } 
}