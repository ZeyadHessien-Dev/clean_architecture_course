import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repositories.dart';

class AddPostsUseCase {
  final PostRepository repositories;
  AddPostsUseCase({required this.repositories});
  Future<Either<Failure,Unit>> call(Post post) async {
    return await repositories.addPost(post);
  }
}