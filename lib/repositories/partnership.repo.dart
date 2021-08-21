import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _partnershipUrl = '/partnership';

class PartnershipRepo {
  Future<Partnership> save(Partnership partnership) async {
    final String encodedJson = jsonEncode(
      partnership.toJson(),
    );
    final Response response = await client
        .post(
          mainUrl + _partnershipUrl,
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
      return Partnership.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<List<Partnership>> findAll() async {
    final Response response = await client
        .get(
          mainUrl + _partnershipUrl + "/list",
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson
          .map(
            (dynamic json) => Partnership.fromJson(json),
          )
          .toList();
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<Partnership> update(Partnership partnership) async {
    final String encodedJson = jsonEncode(
      partnership.toJson(),
    );
    final Response response = await client
        .put(
          mainUrl + _partnershipUrl + "/" + partnership.id.toString(),
          headers: {
            'Content-type': 'application/json',
          },
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      return Partnership.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }
}
