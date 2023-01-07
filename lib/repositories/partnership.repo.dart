import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/partnership.dart';
import 'package:http/http.dart';
import '../common/injection.dart';
import '../common/settings.dart';
import '../models/token.dart';

const String _partnershipUrl = '/partnership';

class PartnershipRepo {
  Future<Partnership> save(Partnership partnership) async {
    try {
      final String encodedJson = jsonEncode(
        partnership.toJson(),
      );
      final Response response = await client
          .post(
            Uri.parse(mainUrl + _partnershipUrl),
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
        return Partnership.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Partnership>> findAll() async {
    try {
      final Response response = await client.get(
        Uri.parse(mainUrl + _partnershipUrl + "/list"),
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
              (dynamic json) => Partnership.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Partnership> update(Partnership partnership) async {
    try {
      final String encodedJson = jsonEncode(
        partnership.toJson(),
      );
      final Response response = await client
          .put(
            Uri.parse(
                mainUrl + _partnershipUrl + "/" + partnership.id.toString()),
            headers: {
              'Content-type': 'application/json',
              HttpHeaders.authorizationHeader: locator.get<Token>().token,
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
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> deleteById(Partnership partnership) async {
    try {
      final Response response = await client.delete(
        Uri.parse(mainUrl + _partnershipUrl + "/" + partnership.id.toString()),
        headers: {
          'Content-type': 'application/json',
          HttpHeaders.authorizationHeader: locator.get<Token>().token,
        },
      ).timeout(
        Duration(seconds: 10),
      );
      if (response.statusCode == 204) {
        return response;
      } else {
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }
}
