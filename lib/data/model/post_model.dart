import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required int id,
    required String title,
    required String body,
  }) : super(id: id, title: title, body: body);

  // Convert JSON to PostModel
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Convert PostModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
