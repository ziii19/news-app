import 'package:dio/dio.dart';
import 'package:news/features/news/models/models.dart';
import 'package:news/features/profile/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database {
  Database();

  String? auth;

  Dio get dio {
    return Dio()
      ..options = BaseOptions(
        baseUrl: 'http://portal-berita.test/api',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $auth'
        },
      );
  }

  Future<(bool, String)> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/login',
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

  Future<(bool, String)> register({
    required String username,
    required String firstname,
    String? lastname,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/register',
        data: {
          'username': username,
          'firstname': firstname,
          'lastname': lastname,
          'email': email,
          'password': password
        },
      );

      if (response.statusCode == 200) {
        return (true, response.data['message'] as String);
      } else {
        return (false, response.data['message'] as String);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response!.data;
        return (false, data['message'] as String);
      } else {
        return (false, 'Network error: ${e.message.toString()}');
      }
    }
  }

  Future<UserModel?> getUser() async {
    try {
      // Get token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      auth = prefs.getString('token');
      print(auth);

      if (auth != null) {
        final response = await dio.get('/user');
        print(response);

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
        throw Exception('No auth token found (User is not logged in)');
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
      await dio.get('/logout');

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

  Future<List<PostModel>> getNewsContent() async {
    try {
      // Get token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      auth = prefs.getString('token');

      final response = await dio.get('/posts');

      if (response.statusCode == 200) {
        // Parse the response data
        List<dynamic> data = response.data['data'];
        return data.map((item) => PostModel.fromJSON(item)).toList();
      } else {
        // Handle other status codes if needed
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> showContentDetail({required int id}) async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    auth = prefs.getString('token');
    await dio.get('/posts/$id');
  }

  Future<void> like({required int id}) async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    auth = prefs.getString('token');

    await dio.post("/posts/$id/like");
  }

  Future<void> unlike({required int id}) async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    auth = prefs.getString('token');

    await dio.post("/posts/$id/unlike");
  }
}
