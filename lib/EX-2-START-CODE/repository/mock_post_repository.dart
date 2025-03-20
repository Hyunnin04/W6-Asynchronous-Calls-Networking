import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPost() async {
    await Future.delayed(Duration(seconds: 5)); // Simulating network delay
    return [
      Post(
        id: 25,
        title: 'Who is the best',
        description: 'teacher ronan',
      ),
      Post(
        id: 25,
        title: 'Who is the best',
        description: 'teacher ronan',
      ),
      Post(
        id: 25,
        title: 'Who is the best',
        description: 'teacher ronan',
      ),
    ];
  }
}




