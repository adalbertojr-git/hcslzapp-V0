import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/password.dto.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _forgotlUrl = '/forgotpassword';

class ForgotPasswordRepo {
  Future<PasswordDTO> sendEmail(String email) async {
    final Response response = await client
        .get(
          Uri.parse(mainUrl + _forgotlUrl + "/send/" + email),
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      return PasswordDTO.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<String> validateCode(PasswordDTO passwordDTO) async {
    final String encodedJson = jsonEncode(
      passwordDTO.toJson(),
    );
    final Response response = await client
        .post(
          Uri.parse(mainUrl + _forgotlUrl + "/validate"),
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
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
  }
}
