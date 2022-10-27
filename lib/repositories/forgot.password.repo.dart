import 'dart:async';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _forgotlUrl = '/forgotpassword';

class ForgotPasswordRepo {
  Future<String> sendEmail(String email) async {
    final Response response = await client
        .get(
          Uri.parse(mainUrl + _forgotlUrl + "/send/" + email),
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
