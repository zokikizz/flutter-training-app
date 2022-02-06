
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';

import '../models/auth_token.dart';
import '../notifier/auth.notifier.dart';
import '../constants.dart';


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


Future<void> login(User user, AuthNotifier authNotifier, BuildContext context) async {

  final body =<String, dynamic>{
                  'username': user.email,
                  'password': user.password,
                  };

  EasyLoading.show(status: 'loading...');
  final response = await http.post( 
    Uri.parse( BASE_API_URL + '/token'),
    headers: {
     "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: body,
  ).catchError((error) {
    EasyLoading.dismiss();
    EasyLoading.showError('Failed with Error');
  });

  if (response.statusCode == 200) {

    final User loggedInUser = User(
      email: user.email,
      authToken: AuthToken.fromJson(
        jsonDecode(response.body)
        )
    );
    authNotifier.setUserDetails(loggedInUser);
    EasyLoading.dismiss();
    Navigator.pushNamed(context, '/home');              
  } else {
    EasyLoading.dismiss();
    EasyLoading.showError('Failed with Error');
  }
}


