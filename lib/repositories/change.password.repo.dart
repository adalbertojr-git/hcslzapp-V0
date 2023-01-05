import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/password.dto.dart';
import 'package:http/http.dart';
import '../common/injection.dart';
import '../common/settings.dart';
import '../models/token.dart';

const String _changelUrl = '/changepassword';

class ChangePasswordRepo {
  Future<String> reset(PasswordDTO passwordDTO) async {
    try {
      final String encodedJson = jsonEncode(
        passwordDTO.toJson(),
      );
      final Response response = await client
          .put(
            Uri.parse(mainUrl + _changelUrl + '/reset'),
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              HttpHeaders.authorizationHeader: locator.get<Token>().token,
            },
            body: encodedJson,
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<String> change(PasswordDTO passwordDTO) async {
    try {
      final String encodedJson = jsonEncode(
        passwordDTO.toJson(),
      );
      final Response response = await client
          .put(
            Uri.parse(mainUrl + _changelUrl + '/change'),
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              HttpHeaders.authorizationHeader: locator.get<Token>().token,
            },
            body: encodedJson,
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }
}
