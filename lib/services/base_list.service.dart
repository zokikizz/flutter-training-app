
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'package:runner_project/constants.dart';
import 'package:runner_project/notifier/auth.notifier.dart';
import 'package:runner_project/notifier/base_list_notifier.dart';


Future<void> getList(BaseListNotifier notifier, AuthNotifier authNotifier, String url) async {

  final headers = authNotifier.userDetails?.authToken?.getAuthHeaders();

  final response = await http.get( 
      Uri.parse(BASE_API_URL + url),
      headers: headers as Map<String, String>,
    );
    if (response.statusCode != 200) {
      log('[Error]: ${response.body}, url: $url');
    } else {
      EasyLoading.dismiss();
      notifier.list = jsonDecode(response.body);
    }
}