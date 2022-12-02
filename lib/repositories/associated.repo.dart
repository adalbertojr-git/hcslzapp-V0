import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:hcslzapp/models/month.birthdays.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _associatedUrl = '/associated';

class AssociatedRepo {
  Future<List<Associated>> findAll() async {
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
  }

  Future<List<Associated>> findAllAdminToList() async {
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
  }

  Future<List<Associated>> findAllNotAdminToList() async {
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
  }

  Future<List<Associated>> findAllActive() async {
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
  }

  Future<List<Associated>> findByIdToList(int id) async {
    final Response response = await client
        .get(
          Uri.parse(mainUrl + _associatedUrl + '/' + id.toString()),
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
  }

  Future<Associated> update(Associated associated) async {
    final String encodedJson = jsonEncode(
      associated.toJson(),
    );
    final Response response = await client
        .put(
          Uri.parse(mainUrl + _associatedUrl + "/" + associated.id.toString()),
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
  }

  Future<List<MonthBirthdays>> findBirthdays() async {
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
  }
}
