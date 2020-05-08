import 'package:interview_test_darshana_nagekar/model/post.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:interview_test_darshana_nagekar/network_manager/network_constants.dart';

class PostRepository {
  //Get all the post
  static Future<Map> fetchPost() async {
    Map<String, dynamic> responseMap = new Map();

    final response = await http.get(NetworkConstants.apiEndPoint);

    if (response.statusCode == 200) {
      responseMap.addAll({'statusCode': 200});
      responseMap.addAll({'posts': Post().allPostsFromJson(response.body)});
      return responseMap;
    } else {
      responseMap.addAll({'statusCode': response.statusCode});
      responseMap.addAll({'posts': []});
      throw Exception('Failed to load posts');
    }
  }


//Get all the post by id to display the details of the Post

  static Future<Map> getPostById(id) async {
    Map<String, dynamic> postMap = new Map();
    final response = await http.get('${NetworkConstants.apiEndPoint}/$id');
    print(response.statusCode);
    if (response.statusCode == 200) {
      Post post = Post.fromJson(json.decode(response.body));
      postMap.addAll({'statusCode': 200});
      postMap.addAll({'post': post});
      return postMap;
    } else {
      postMap.addAll({'statusCode': response.statusCode});
      postMap.addAll({'post': []});
      throw Exception('Failed to load posts');
    }
  }


//Delete post by id

  static Future<int> deletePostById(id) async {
    final response = await http.delete('${NetworkConstants.apiEndPoint}/$id');
   print("deleted succesfully ${response.statusCode}");
    return response.statusCode;
  }


  //Update post by id

  static Future<int> updatePostById(id, Map body) async {
    print("updated title ${body["title"]}");
    print(" updated body ${body["body"]}");
    final response =
        await http.put('${NetworkConstants.apiEndPoint}/$id', body: body);
    print(response.statusCode);

    return response.statusCode;
  }


  //Create post

  static Future<int> createPost(Map body) async {
    print("created title ${body["title"]}");
    print(" created body ${body["body"]}");
    final response =
        await http.post('${NetworkConstants.apiEndPoint}', body: body);
    print(response.statusCode);

    return response.statusCode;
  }
}
