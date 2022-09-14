import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repositories.dart';

class GetAllPostsUseCase {
  final PostRepository repositories;
  GetAllPostsUseCase({required this.repositories});
  Future<Either<Failure,Unit>> call(Post post) async {
    return await repositories.addPost(post);
  }
}