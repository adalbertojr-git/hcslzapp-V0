import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:hcslzapp/models/token.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _authUrl = '/authenticate';
const String _accReqUrl = '/accrequest';

class LoginRepo {
  Future<Token> authenticate(String username, String password) async {
    Map params = {"username": username, "password": password};
    final Response response = await client
        .post(
          mainUrl + _authUrl,
          headers: {'Content-type': 'application/json'},
          body: jsonEncode(
            params,
          ),
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      return Token.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<AccessRequest> accessRequest(AccessRequest accessRequest) async {
    final String encodedJson = jsonEncode(
      accessRequest.toJson(),
    );
    final Response response = await client
        .post(
          mainUrl + _accReqUrl,
          headers: {'Content-type': 'application/json'},
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    print(accessRequest);
    print(response.statusCode);
    if (response.statusCode == 201) {
      return AccessRequest.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }
}
