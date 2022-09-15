import 'package:clean_architecture_course/core/error/failure.dart';
import 'package:clean_architecture_course/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_course/features/posts/domain/repositories/post_repositories.dart';
import 'package:dartz/dartz.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';


class PostRepositoryImplement implements PostRepository {
  /// Data Sources
  final PostRemoteDataSource remoteDataSource;  // [Dio , Http] when Deal with APIs
  final PostLocalDataSource localDataSource;    // [Shared Preferences , SQflite DB]

  PostRepositoryImplement({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    /// Here Suppose Write DataSource Either APIs or Local DB

    /// 1. First Thing I must know if my device contain on internet or not ?   until know if I deal with [remote or local] or not
    await remoteDataSource.getAllPosts();
    await localDataSource.getCachedPosts();
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    throw UnimplementedError();
  }
}
