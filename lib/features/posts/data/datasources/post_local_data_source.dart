import 'package:clean_architecture_course/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostLocalDataSource {
  Future<Unit> cachePost(List<PostModel> postModels);
  Future<List<PostModel>>getCachedPosts();
}
class PostLocalDataSourceImp implements PostLocalDataSource {
  @override
  Future<Unit> cachePost(List<PostModel> postModels) {
    throw UnimplementedError();
  }
  @override
  Future<List<PostModel>> getCachedPosts() {
    throw UnimplementedError();
  }
}
