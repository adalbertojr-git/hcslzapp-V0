import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/token.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _loginUrl = '/authenticate';

class LoginRepo {
  Future<Token> login(String username, String password) async {
    Map params = {"username": username, "password": password};
    final Response response = await client
        .post(
          mainUrl + _loginUrl,
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(
            params,
          ),
        )
        .timeout(
          Duration(seconds: 10),
        );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Token.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print(getMessage(response.statusCode));
      throw HttpException(getMessage(response.statusCode));
    }
  }
}
