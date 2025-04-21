import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobil_app/feature/model/comment_post_model.dart';

abstract class ICommentService {
  Future<bool> postComment({
    required String symbol,
    required CommentPostModel comment,
    required String token,
  });
}

class CommentService extends ICommentService {
  final Dio dio;
  CommentService(this.dio);

  @override
  Future<bool> postComment({
    required String symbol,
    required CommentPostModel comment,
    required String token,
  }) async {
    try {
      final response = await dio.post(
        'comment/$symbol',
        //'/api/comment/$symbol',
        data: comment.toJson(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        ),
      );
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      debugPrint('Yorum gönderme hatası: $e');
      return false;
    }
  }
}
