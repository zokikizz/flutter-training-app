

class Token {
  String? token;
  String? tokenType;

  Token();

  Token.fromMap(Map<String, dynamic> data) {
    token = data['token'];
    tokenType = data['tokenType'];
  }

  Map<String, dynamic> toMap() {
    return {
      'token': 'token',
      'tokenType': tokenType 
    };
  }
}

