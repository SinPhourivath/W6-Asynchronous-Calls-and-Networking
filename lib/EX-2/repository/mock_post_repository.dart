import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  List<Post> posts = [
    Post(id: 1, title: 'What is the best course', description: 'Flutter'),
    Post(id: 2, title: 'What is the best drink', description: 'coffe'),
    Post(id: 25, title: 'Who is the best', description: 'teacher ronan'),
  ];

  // 5 second delay to simulate api response
  @override
  Future<List<Post>> getPosts() {
    return Future.delayed(Duration(seconds: 5), () {
      return posts;
    });
  }
}
