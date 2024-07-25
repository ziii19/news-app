import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/features/profile/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
  Database();

  String? auth;

  Dio get dio {
    return Dio()
      ..options = BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth'
        },
      );
  }

  Future<(bool, String)> login(String email, String password) async {
    try {
      final response = await Dio().post(
        'http://portal-berita.test/api/login',
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        // Parsing response data
        final data = response.data;
        final token = data['token'];

        // Save personal access token to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        // Set token dio Authorization
        auth = token;

        return (true, data['message'] as String);
      } else {
        // Handle different status codes and errors
        final data = response.data;
        return (false, data['message'] as String);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        final data = e.response!.data;
        return (false, data['message'] as String);
      } else {
        // Some other error occurred
        return (false, e.message.toString());
      }
    }
  }

  Future<String> register({
    required String username,
    required String firstname,
    String? lastname,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'http://portal-berita.test/api/register',
        data: {
          "email": email,
          "username": username,
          "firstname": firstname,
          "lastname": lastname,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        return response.data['message'];
      } else {
        return response.data['message'];
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        final data = e.response?.data;
        throw ErrorDescription('${data['message'] ?? 'Unknown error'}');
      } else {
        // Some other error occurred
        throw 'Error: ${e.message}';
      }
    }
  }

  Future<UserModel?> getUser() async {
    try {
      // Get token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      auth = prefs.getString('token');

      if (auth != null) {
        final response = await dio.get('http://portal-berita.test/api/user');

        if (response.statusCode == 200) {
          final userData = response.data;
          if (userData != null) {
            return UserModel.fromJson(userData);
          } else {
            return null;
          }
        } else {
          throw Exception('Failed to get user data');
        }
      } else {
        throw Exception('No auth token found');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.response?.data['message']}');
    }
  }

  Future<void> logout() async {
    try {
      // Get token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      auth = prefs.getString('token');

      // Logout and remove personal access token from database
      await dio.get('http://portal-berita.test/api/logout');

      // remove token from SharedPreferences
      prefs.remove('token');
    } on DioException catch (e) {
      if (e.response?.data['message'] is String) {
        throw Exception('Network error: ${e.response?.data['message']}');
      } else {
        throw Exception('Unknown error occurred');
      }
    }
  }
}
