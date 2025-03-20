import '../model/post.dart';

class PostDto {
  final int id;
  final String title;
  final String body;

  PostDto({required this.id, required this.title, required this.body});

  factory PostDto.fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id') || json['id'] is! int) {
      throw Exception("Invalid or missing 'id'");
    }

    if (!json.containsKey('title') || json['title'] is! String) {
      throw Exception("Invalid or missing 'title'");
    }

    if (!json.containsKey('body') || json['body'] is! String) {
      throw Exception("Invalid or missing 'description'");
    }

    return PostDto(id: json['id'], title: json['title'], body: json['body']);
  }

  Post toPost() {
    return Post(id: id, title: title, description: body);
  }
}
