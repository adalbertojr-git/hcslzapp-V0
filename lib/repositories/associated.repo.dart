import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:http/http.dart';
import '../settings.dart';

const String _associatedUrl = '/associados';

class AssociatedRepo {
  Future<List<Associated>> findAll() async {
    final Response response = await client
        .get(mainUrl + _associatedUrl)
        .timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Associated.fromJson(json))
        .toList();
  }

  Future<List<Associated>> findByCode(int code) async {
    final Response response = await client
        .get(mainUrl + _associatedUrl + '/' + code.toString())
        .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson
          .map((dynamic json) => Associated.fromJson(json))
          .toList();
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }
}
