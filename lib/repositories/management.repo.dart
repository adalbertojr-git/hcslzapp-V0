import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:http/http.dart';
import '../common/injection.dart';
import '../common/settings.dart';
import '../models/associated.dart';
import '../models/token.dart';

const String _managUrl = '/management';

class ManagementRepo {
  Future<Response> save(List<int> ints) async {
    try {
      final String encodedJson = jsonEncode(
        ints,
      );
      final Response response = await client
          .post(
            Uri.parse(mainUrl + _managUrl),
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
      if (response.statusCode == 204) {
        return response;
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> deleteById(Associated associated) async {
    try {
      final Response response = await client.delete(
        Uri.parse(mainUrl + _managUrl + "/" + associated.id.toString()),
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
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }
}
