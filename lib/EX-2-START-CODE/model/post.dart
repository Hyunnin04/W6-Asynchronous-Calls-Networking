import 'package:flutter_hw1/EX-2-START-CODE/DTO/post_dto.dart';

class Post {
  final int id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});

  // Factory constructor to create Post from PostDto
  factory Post.fromDto(PostDto dto) {
    return Post(id: dto.id, title: dto.title, description: dto.description);
  }
}
