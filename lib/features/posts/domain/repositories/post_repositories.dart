import '../entities/post_entity.dart';

abstract class PostRepository {
  /// Future --> Because These All Posts will come from API
  Future<List<Post>> getAllPosts();
  Future<bool> deletePost(int id);
  Future<bool> updatePost(Post post);
  Future<bool> addPost(Post post);
}