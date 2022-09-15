import '../../domain/entities/post_entity.dart';

/// Extend From Entity
class PostModel extends Post {
  PostModel({required super.id, required super.title, required super.body});

  /// When Model Extend From Another Model and required writing data like this case
  factory PostModel.fromJson(Map <String, dynamic> json) {
    return PostModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}