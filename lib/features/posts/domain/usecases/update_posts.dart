import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repositories.dart';

class UpdatePostsUseCase {
  final PostRepository repositories;
  UpdatePostsUseCase({required this.repositories});
  Future<Either<Failure,Unit>> call(Post post) async {
    return await repositories.updatePost(post);
  }
}