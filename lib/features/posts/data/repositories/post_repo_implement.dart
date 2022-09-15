import 'package:clean_architecture_course/core/error/failure.dart';
import 'package:clean_architecture_course/core/exceptions/exceptions.dart';
import 'package:clean_architecture_course/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_course/features/posts/domain/repositories/post_repositories.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';
import '../models/post_model.dart';


typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class PostRepositoryImplement implements PostRepository {
  /// Data Sources
  final PostRemoteDataSource remoteDataSource; // [Dio , Http] when Deal with APIs
  final PostLocalDataSource localDataSource; // [Shared Preferences , SQflite DB]
  final NetworkInformation networkInfo;

  PostRepositoryImplement(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePost(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getCachedPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return await _getMethod(() => remoteDataSource.addPost(postModel));

  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return await _getMethod(() => remoteDataSource.deletePosts(postId));
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    );
    return await _getMethod(() => remoteDataSource.updatePosts(postModel));

  }

  Future<Either<Failure, Unit>> _getMethod(Future<Unit> Function() addOrDeleteOrUpdateMethod) async {
    if (await networkInfo.isConnected) {
      try {
        await addOrDeleteOrUpdateMethod();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
