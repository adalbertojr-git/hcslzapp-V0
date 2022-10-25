import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/dtc.code.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _emailUrl = '/email';

class EmailRepo {
  Future<String> forgotPassword(String email) async {
    final Response response = await client
        .get(
          Uri.parse(mainUrl + _emailUrl + "/forgot/" + email),
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
