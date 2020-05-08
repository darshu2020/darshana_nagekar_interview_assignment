import 'package:flutter/material.dart';
import 'package:interview_test_darshana_nagekar/model/post.dart';

PostProvider postProvider = new PostProvider();

ValueNotifier<Map> postNotifier = new ValueNotifier<Map>(postProvider.posts);

ValueNotifier<Map> singlePostNotifier =
    new ValueNotifier<Map>(postProvider.singlePost);

class PostProvider extends ChangeNotifier {
  static PostProvider _postModel = PostProvider._internal();
  static Post post = new Post();

  factory PostProvider() {
    return _postModel;
  }
  PostProvider._internal();

  Map posts = {'statusCode': 201, 'posts': []};
  Map singlePost = {'statusCode': 201, 'posts': post};

  void add(Map item) {
    posts = new Map.from(item);
    postNotifier.value = posts;
    postNotifier.notifyListeners();
  }

  void getSinglePost(Map post) {
    singlePost = new Map.from(post);
    
    singlePostNotifier.value = singlePost;
    singlePostNotifier.notifyListeners();
  }

void resetSinglePost() {
 singlePostNotifier.value  =  ({'statusCode': 201, 'posts': null});
  singlePostNotifier.notifyListeners();
}

}

