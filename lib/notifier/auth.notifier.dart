import 'package:flutter/foundation.dart';
import '../models/auth_token.dart';

class AuthNotifier extends ChangeNotifier {

  User? _userDetails;

  User? get userDetails => _userDetails;

  setUserDetails(User user) {
    _userDetails = user;
    notifyListeners();
  }

}