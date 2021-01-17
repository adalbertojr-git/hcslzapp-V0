import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _associatedUrl = '/associated';

class AssociatedRepo {
  Future<List<Associated>> findAll() async {
    final Response response =
        await client.get(mainUrl + _associatedUrl).timeout(
              Duration(seconds: 10),
            );
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map(
          (dynamic json) => Associated.fromJson(json),
        )
        .toList();
  }

  Future<List<Associated>> findByIdAssociatedToList(int id) async {
    final Response response = await client
        .get(
          mainUrl + _associatedUrl + '/list/' + id.toString(),
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
          mainUrl + _associatedUrl + "/" + associated.id.toString(),
          headers: {'Content-type': 'application/json'},
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    print(associated);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Associated.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }
}
