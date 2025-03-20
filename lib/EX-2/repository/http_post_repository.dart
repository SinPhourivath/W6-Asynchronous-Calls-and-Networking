import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:week6/EX-2/model/post.dart';
import 'package:week6/EX-2/repository/post_repository.dart';

import '../dto/post_dto.dart';

class HttpPostRepository implements PostRepository {
  @override
  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );

      if (response.statusCode == 200) {
        // Get data from the response body
        List<dynamic> data = json.decode(response.body);

        // Pass each object through DTO to check for parsing issue
        // Maybe more efficient to have fromJsonList?
        List<Post> posts =
            data.map((json) => PostDto.fromJson(json).toPost()).toList();

        return posts;
      } else {
        throw Exception('Error getting post');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
