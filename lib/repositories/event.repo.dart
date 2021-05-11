import 'dart:convert';
import 'package:hcslzapp/models/event.dart';
import 'package:http/http.dart';
import '../common/settings.dart';
import 'package:hcslzapp/http/http.exception.dart';

const String _eventUrl = '/event';

class EventRepo {
  Future<String> findAll() async {
    final Response response = await client.get(mainUrl + _eventUrl).timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<Event> save(Event event) async {
    final String encodedJson = jsonEncode(
      event.toJson(),
    );
    final Response response = await client
        .post(
          mainUrl + _eventUrl + "/save",
          headers: {
            'Content-type': 'application/json',
          },
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      return Event.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<Response> delete(List event) async {
    final String encodedJson = jsonEncode(
      event,
    );
    final Response response = await client
        .post(
          mainUrl + _eventUrl + "/delete",
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
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
  }
}
