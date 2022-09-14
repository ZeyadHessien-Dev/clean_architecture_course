import 'package:equatable/equatable.dart';

class Post extends Equatable {
  /// Why don't put userId Var that in post_sample.json -->
  /// Because I don't need it and If you wanna remove them there [file] no problem
  int id;
  String title;
  String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props => [id, title, body]; // Implement Hash Code method

}
