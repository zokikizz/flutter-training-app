import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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


Future<void> activateAccount(String activationCode, String password, String email, BuildContext context) async {
  EasyLoading.show(status: 'loading...');

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
  if (response.statusCode != 200) {
    final errorResponse = ErrorResponse.fromJson(jsonDecode(response.body));
    EasyLoading.dismiss();
    EasyLoading.showError(errorResponse.detail);
  } else {
    EasyLoading.dismiss();
    Navigator.pushNamed(context, '/login');   
  }
  
}


