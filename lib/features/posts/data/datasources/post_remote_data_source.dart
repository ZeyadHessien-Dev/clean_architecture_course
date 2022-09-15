import 'package:clean_architecture_course/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemoteDataSource {
  /// <PostModel> Not Post Because We're in Data Layer
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(int postID);
  Future<Unit> deletePosts(PostModel postModel);
  Future<Unit> updatePosts(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<Unit> addPost(int postID) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePosts(PostModel postModel) {
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePosts(PostModel postModel) {
    throw UnimplementedError();
  }


}

/// Why use abstract class Above ? OR Why don't use these one of classes of following directly
/// Until I can implements more than one time
/// So that if there is a problem in one of following class, I have another class to copy methods , Don't Impl From 0
// class PostRemoteImplWithDio implements PostRemoteDataSource {
//   @override
//   Future<Unit> addPost() {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Unit> deletePosts() {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<PostModel>> getAllPosts() {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Unit> updatePosts() {
//     throw UnimplementedError();
//   }
//
// }
// class PostRemoteImplWithHttp implements PostRemoteDataSource {
//   @override
//   Future<Unit> addPost() {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Unit> deletePosts() {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<PostModel>> getAllPosts() {
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Unit> updatePosts() {
//     throw UnimplementedError();
//   }
// }