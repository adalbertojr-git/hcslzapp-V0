import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _managUrl = '/management';

class ManagementRepo {
  Future<Response> save(List<int> ints) async {
    final String encodedJson = jsonEncode(
      ints,
    );
    final Response response = await client
        .post(
          Uri.parse(mainUrl + _managUrl),
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

  Future<Response> deleteById(Associated associated) async {
    final String encodedJson = jsonEncode(
      associated.toJson(),
    );
    final Response response = await client.delete(
      Uri.parse(mainUrl + _managUrl + "/" + associated.id.toString()),
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
  }
}
