import 'package:dio/dio.dart';

class Database {
  Database({this.auth});

  final String? auth;

  Dio get dio {
    return Dio()
      ..options = BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $auth'
        },
      );
  }

  Future<String> login(String email, String password) async {
    try {
      final response = await Dio().post(
        'http://portal-berita.test/api/login',
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        // Parsing response data
        final data = response.data;
        return data['token'];
      } else {
        // Handle different status codes and errors
        final data = response.data;
        return 'Error: ${data['message']}';
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // The server responded with an error
        final data = e.response!.data;
        return 'Error: ${data['message']}';
      } else {
        // Some other error occurred
        return 'Error: ${e.message}';
      }
    }
  }
}
