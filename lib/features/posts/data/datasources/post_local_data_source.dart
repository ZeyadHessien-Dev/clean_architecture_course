import 'dart:convert';

import 'package:clean_architecture_course/core/exceptions/exceptions.dart';
import 'package:clean_architecture_course/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  Future<Unit> cachePost(List<PostModel> postModels);
  Future<List<PostModel>> getCachedPosts();
}

const CACHED_POSTS = "CachedPost";

class PostLocalDataSourceImp implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cachePost(List<PostModel> postModels) {
    /// Steps -->
    /// 1 - Convert From List<Model> To List<Map>
    /// 2 - Convert From List<Map> To Json.encode(List<Map>)
    /// 3 - Store in Shared Preferences
    List postModelToJson = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_POSTS, json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    /// 4 - Get From Shared Preferences
    /// 5 - Convert From Json.decode To List<Map>
    /// 6 - Convert From List<Map> To List<Model> To Deal With it
    final jsonString = sharedPreferences.get(CACHED_POSTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString.toString());
      List<PostModel> jsonToPostModel = decodeJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModel);
    }
    else {
      throw EmptyCacheException();
    }
  }
}
