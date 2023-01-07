import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/password.dto.dart';
import 'package:http/http.dart';
import '../common/injection.dart';
import '../common/settings.dart';
import '../models/token.dart';

const String _forgotlUrl = '/forgotpassword';

class ForgotPasswordRepo {
  Future<PasswordDTO> sendEmail(String email) async {
    try {
      final Response response = await client.get(
        Uri.parse(mainUrl + _forgotlUrl + "/send/" + email),
        headers: {
          'Content-type': 'application/json',
          HttpHeaders.authorizationHeader: locator.get<Token>().token,
        },
      ).timeout(
        Duration(seconds: 30),
      );
      if (response.statusCode == 200) {
        return PasswordDTO.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<String> validateCode(PasswordDTO passwordDTO) async {
    try {
      final String encodedJson = jsonEncode(
        passwordDTO.toJson(),
      );
      final Response response = await client
          .post(
            Uri.parse(mainUrl + _forgotlUrl + "/validate"),
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
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }
}
