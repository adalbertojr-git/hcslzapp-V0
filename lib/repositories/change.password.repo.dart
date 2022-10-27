import 'dart:async';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _changelUrl = '/changepassword';

class ChangePasswordRepo {
  Future<String> update(String password) async {
    final Response response = await client
        .put(
          Uri.parse(mainUrl + _changelUrl),
          headers: {
            'Content-type': 'application/json',
          },
          body: password,
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
