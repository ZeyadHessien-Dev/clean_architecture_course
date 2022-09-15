import 'package:clean_architecture_course/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostLocalDataSource {
  /// Here In Local I need to method to cache[save] Posts In my device
  Future<Unit> cachePost(List<PostModel> postModels); /// Unit Because I don't need to return thing , Just I will give to method posts and I wanna save them

  /// Here In Local I need to method to get Caching[Get Posts] when I need
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
