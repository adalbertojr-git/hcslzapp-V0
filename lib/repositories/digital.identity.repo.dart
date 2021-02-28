import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _digitalIdentityUrl = '/digitalidentity';

class DigitalIdentityRepo {
  Future<List<Associated>> findAssociatedByIdToList(int id) async {
    final Response response = await client
        .get(
          mainUrl + _digitalIdentityUrl + '/' + id.toString(),
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

}
