import 'dart:convert';

import 'package:clean_architecture_course/core/exceptions/exceptions.dart';
import 'package:clean_architecture_course/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();

  Future<Unit> addPost(PostModel postModel);

  Future<Unit> deletePosts(int postId);

  Future<Unit> updatePosts(PostModel postModel);
}

const BASE_URL = "http://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;
  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/posts/"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body);
      final List<PostModel> postModels = decodeJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    final response = await client.post(
      Uri.parse("$BASE_URL/posts/"),
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    );
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePosts(int postId) async {
    final response = await client.delete(
      Uri.parse("$BASE_URL/posts/${postId.toString()}"),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePosts(PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    final response = await client.delete(
      Uri.parse("$BASE_URL/posts/$postId"),
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }  }
}
