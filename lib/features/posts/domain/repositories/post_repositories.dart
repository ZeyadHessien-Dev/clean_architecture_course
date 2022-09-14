import '../../../../core/error/failure.dart';
import '../entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  /// Either Indicate DartZ Package [IF NO Internet will execute specific thing]
  /// Failure --> can name it up to you
  /// Unit --> is Nothing , in deletePost for example if deletePost and No Internet will return Failure, and if deletePost and Internet exist Unit nothing execute method
  Future<Either<Failure,List<Post>>> getAllPosts();
  Future<Either<Failure,Unit>> deletePost(int id);
  Future<Either<Failure,Unit>> updatePost(Post post);
  Future<Either<Failure,Unit>> addPost(Post post);
}