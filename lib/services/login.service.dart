
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';
import '../utils/helper.dart';


class LoginResponse {
  final String accessToken;
  final String tokenType;

  const LoginResponse({
    required this.accessToken,
    required this.tokenType,
    });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      );
  }
}


Future<LoginResponse> login(String email, String password) async {

  final body =<String, String>{
                  'username': email,
                  'password': password
                  };
  
  final response = await http.post( 
    Uri.parse( BASE_API_URL + '/token'),
    headers: {
     "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: body,
  );

  if (response.statusCode != 200) {
    final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
    throw Exception(errorResponse.detail);
  }
  final responseObject = LoginResponse.fromJson(jsonDecode(response.body));
  return responseObject;
}


