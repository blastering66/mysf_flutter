import 'package:mysff_flutter/core/types/user.dart';

class ApiResponse {
  final int status;
  final String message;
  final User user;

  ApiResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final result = json['data']['result'] ?? {} as Map<String, dynamic>;
    return ApiResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      user: User.fromJson(result),
    );
  }
}