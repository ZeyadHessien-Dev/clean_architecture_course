import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/post_repositories.dart';

class GetAllPostsUseCase {
  final PostRepository repositories;
  GetAllPostsUseCase({required this.repositories});
  Future<Either<Failure,Unit>> call(int id) async {
    return await repositories.deletePost(id);
  }
}