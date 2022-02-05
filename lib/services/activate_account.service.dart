import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';
import '../utils/helper.dart';


class ActivateAccountResponse {
  final String status;

  const ActivateAccountResponse({
    required this.status
    });

  factory ActivateAccountResponse.fromJson(Map<String, dynamic> json) {
    return ActivateAccountResponse(
      status: json['status'] as String,
      );
  }
}


Future<ActivateAccountResponse> activateAccount(String activationCode, String password, String email) async {

  final body =<String, String>{
                  "activationToken": activationCode,
                  "password": password,
                  "email": email,
                  };

  final response = await http.put( 
    Uri.parse(BASE_API_URL + '/activate'),
    headers: {
     "Content-Type": "application/json",
    },
    encoding: Encoding.getByName('utf-8'),
    body: jsonEncode(body),
  );
  print(response.body);
  print(response.statusCode);
  if (response.statusCode != 200) {
    final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
    throw Exception(errorResponse.detail);
  }
  final responseObject = ActivateAccountResponse.fromJson(jsonDecode(response.body));
  return responseObject;
}


