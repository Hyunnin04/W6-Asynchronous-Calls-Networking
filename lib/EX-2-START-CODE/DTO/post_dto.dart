class PostDto {
  final int id;
  final String title;
  final String description;

  PostDto({required this.id, required this.title, required this.description});

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      id: json['id'],
      title: json['title'],
      description: json['body'],
    );
  }
}
