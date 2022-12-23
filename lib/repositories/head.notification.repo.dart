import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/head.notification.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _notificationUrl = '/notification';

class HeadNotificationRepo {
  Future<List<HeadNotification>> findAll() async {
    try {
      final Response response = await client
          .get(
            Uri.parse(mainUrl + _notificationUrl + "/list"),
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map(
              (dynamic json) => HeadNotification.fromJson(json),
            )
            .toList();
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<HeadNotification> save(HeadNotification headNotification) async {
    try {
      final String encodedJson = jsonEncode(
        headNotification.toJson(),
      );
      final Response response = await client
          .post(
            Uri.parse(mainUrl + _notificationUrl),
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
        return HeadNotification.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<HeadNotification> update(HeadNotification headNotification) async {
    try {
      final String encodedJson = jsonEncode(
        headNotification.toJson(),
      );
      final Response response = await client
          .put(
            Uri.parse(mainUrl +
                _notificationUrl +
                "/" +
                headNotification.id.toString()),
            headers: {
              'Content-type': 'application/json',
            },
            body: encodedJson,
          )
          .timeout(
            Duration(seconds: 10),
          );
      if (response.statusCode == 200) {
        return HeadNotification.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw HttpException(getMessage(response.statusCode));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> deleteById(HeadNotification headNotification) async {
    try {
      final Response response = await client.delete(
        Uri.parse(
            mainUrl + _notificationUrl + "/" + headNotification.id.toString()),
        headers: {
          'Content-type': 'application/json',
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
