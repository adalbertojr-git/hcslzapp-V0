import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/dtc.code.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _dtcCodeUrl = '/dtccode';

class DtcCodeRepo {
  Future<List<DtcCode>> findAll() async {
    final Response response = await client
        .get(
          Uri.parse(mainUrl + _dtcCodeUrl + "/list"),
        )
        .timeout(
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
      throw HttpException(getMessage(response.statusCode));
    }
  }
}
