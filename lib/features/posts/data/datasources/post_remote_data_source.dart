import 'package:clean_architecture_course/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel postModel);
  Future<Unit> deletePosts(int postId);
  Future<Unit> updatePosts(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<Unit> addPost(PostModel postModel) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePosts(int postId) {
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

