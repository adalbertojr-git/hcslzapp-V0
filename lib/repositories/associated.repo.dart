import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/month.birthdays.dart';
import 'package:http/http.dart';
import '../common/injection.dart';
import '../common/settings.dart';
import '../models/token.dart';

const String _associatedUrl = '/associated';

class AssociatedRepo {
  Future<List<Associated>> findAll() async {
    try {
      final Response response = await client
          .get(
            Uri.parse(mainUrl + _associatedUrl + "/list"),
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map(
              (dynamic json) => Associated.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Associated>> findAllAdminToList() async {
    try {
      final Response response = await client
          .get(
            Uri.parse(mainUrl + _associatedUrl + "/admin"),
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map(
              (dynamic json) => Associated.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Associated>> findAllNotAdminToList() async {
    try {
      final Response response = await client
          .get(
            Uri.parse(mainUrl + _associatedUrl + "/notadmin"),
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map(
              (dynamic json) => Associated.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Associated>> findAllActive() async {
    try {
      final Response response = await client
          .get(
            Uri.parse(mainUrl + _associatedUrl + "/active"),
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map(
              (dynamic json) => Associated.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Associated>> findByIdToList(int id) async {
    try {
      final Response response = await client.get(
        Uri.parse(mainUrl + _associatedUrl + '/' + id.toString()),
        headers: {
          HttpHeaders.authorizationHeader: locator.get<Token>().token,
        },
      ).timeout(
        Duration(seconds: 10),
      );
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map(
              (dynamic json) => Associated.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Associated> update(Associated associated) async {
    try {
      final String encodedJson = jsonEncode(
        associated.toJson(),
      );
      final Response response = await client
          .put(
            Uri.parse(
                mainUrl + _associatedUrl + "/" + associated.id.toString()),
            headers: {
              'Content-type': 'application/json',
            },
            body: encodedJson,
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        return Associated.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<List<MonthBirthdays>> findBirthdays() async {
    try {
      final Response response = await client
          .get(
            Uri.parse(mainUrl + '/monthbirthdays/list'),
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map(
              (dynamic json) => MonthBirthdays.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }
}
