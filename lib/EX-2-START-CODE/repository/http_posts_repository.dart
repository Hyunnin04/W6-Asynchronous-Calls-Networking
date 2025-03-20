import 'dart:convert';

import 'package:flutter_hw1/EX-2-START-CODE/DTO/post_dto.dart';
import 'package:flutter_hw1/EX-2-START-CODE/model/post.dart';
import 'package:flutter_hw1/EX-2-START-CODE/repository/post_repository.dart';
import 'package:http/http.dart' as http;

class HttpRepository extends PostRepository {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  List<Post> postList = [];

  Future<List<Post>> getPost() async {
    try {
      // fetch the data from the url
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        for (var item in data) {
          // load the json to PostDto
          PostDto postDto = PostDto.fromJson(item);
          //convet the PostDto to Post
          postList.add(Post.fromDto(postDto));
        }
      } else {
        throw Exception("Failed to load post");
      }
    } catch (e) {
      throw Exception(e);
    }
    return postList;
  }
}
