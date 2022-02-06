

class AuthToken {
  String? accessToken;
  String? tokenType;

  AuthToken({
    required this.accessToken,
    required this.tokenType,
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      );
  }

  AuthToken.fromMap(Map<String, dynamic> data) {
    accessToken: data['accessToken'];
    tokenType: data['tokenType'];
  }

  Map<String, dynamic> toMap() {
    return {
      'token': accessToken,
      'tokenType': tokenType 
    };
  }

  Map<String, String> getAuthHeaders() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
  }
}


class User {
  String? email;
  String? password;
  AuthToken? authToken;

  User({
    required this.email,
    required this.authToken,
  });
}

