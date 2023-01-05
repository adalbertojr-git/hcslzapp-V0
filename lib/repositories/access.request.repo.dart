import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../common/injection.dart';
import '../http/http.exception.dart';
import '../models/access.request.dart';
import 'package:http/http.dart';
import '../common/settings.dart';
import '../models/token.dart';

const String _accReqUrl = '/accrequest';

class AccessRequestRepo {
  Future<AccessRequest> save(AccessRequest accessRequest) async {
    try {
      final String encodedJson = jsonEncode(
        accessRequest.toJson(),
      );
      final Response response = await client
          .post(
            Uri.parse(mainUrl + _accReqUrl),
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
        return AccessRequest.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<List<AccessRequest>> findAll() async {
    try {
      final Response response = await client.get(
        Uri.parse(mainUrl + _accReqUrl + "/list"),
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
              (dynamic json) => AccessRequest.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> allow(List<AccessRequest> accessRequests) async {
    try {
      final String encodedJson = jsonEncode(
        accessRequests,
      );
      final Response response = await client
          .post(
            Uri.parse(mainUrl + _accReqUrl + "/allow"),
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
        return response;
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> deleteById(AccessRequest accessRequest) async {
    try {
      final Response response = await client.delete(
        Uri.parse(mainUrl + _accReqUrl + "/" + accessRequest.id.toString()),
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
