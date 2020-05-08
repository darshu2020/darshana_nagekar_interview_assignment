import 'dart:convert';

class Post {
  final int userId;
  final int id;
   String title;
   String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }


  List<Post> allPostsFromJson(String str) {
    final jsonData = json.decode(str);

    return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)))
        .toList(growable: true);
  }


  Map<String, dynamic> toJson() =>
      {"title": title, "body": body, "userId": "1"};
}

Map postToJson(Post post) {
    final postObject = post.toJson();

    return postObject;
  }