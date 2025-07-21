class PostModel {
  final int id;
  final String title;
  final String body;
  bool isFavorite;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
    this.isFavorite = false,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }
}
