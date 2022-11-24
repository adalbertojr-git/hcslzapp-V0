import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:http/http.dart';
import '../common/settings.dart';
import '../models/associated.dto.dart';

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

  Future<Response> deleteById(AssociatedDTO associated) async {
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
