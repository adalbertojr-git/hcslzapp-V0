import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/dtc.code.dart';
import 'package:http/http.dart';
import '../common/injection.dart';
import '../common/settings.dart';
import '../models/token.dart';

const String _dtcCodeUrl = '/dtccode';

class DtcCodeRepo {
  Future<List<DtcCode>> findAll() async {
    try {
      final Response response = await client.get(
        Uri.parse(mainUrl + _dtcCodeUrl + "/list"),
        headers: {
          'Content-type': 'application/json',
          HttpHeaders.authorizationHeader: locator.get<Token>().token,
        },
      ).timeout(
        Duration(seconds: 10),
      );
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map(
              (dynamic json) => DtcCode.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }
}
