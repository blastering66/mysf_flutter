import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mysff_flutter/core/types/api_response.dart';
import 'package:mysff_flutter/core/types/user.dart';
import 'package:mysff_flutter/core/services/endpoints.dart';

class AuthService {
  static const String baseUrl = 'https://custinfo.smartfren.com/assembly/sfpas/registry/v4'; // Replace with your API base URL

  static Future<User?> login(String email, String password) async {
    final url = Uri.parse(Endpoint.login.url(baseUrl));
    final responseLogin = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept-Encoding': 'gzip',
        'Accept-Language': 'id',
        'Cache-Control': 'no-cache',
        'carrierName': 'Indihome',
        'connectionType': 'WIFI',
      },
      body: json.encode({'email': email, 'password': password}),
    );

    if (responseLogin.statusCode == 200) {
      final data = json.decode(responseLogin.body);
      final response = ApiResponse.fromJson(data);
      if (response.status == 0) {
        // String sessionId =  data['data']['result']['session_id'] ?? '';
        // String refreshToken =  data['data']['result']['refresh_token'] ?? '';
        return response.user; // Assuming the API returns a session_id
      } else {
        throw Exception('Login failed: ${data['message']}');
      }
    } else {
      throw Exception('Failed to login ABC');
    }
  }

  static Future<String?> refreshToken(String token) async {
    final url = Uri.parse('$baseUrl/refresh');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json', 'Authorization':token},
      body: json.encode({'token': token}),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token']; // Assuming the API returns a new token
    } else {
      throw Exception('Failed to refresh token: ${response.body}');
    }
  }
}
