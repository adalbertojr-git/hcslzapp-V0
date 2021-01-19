import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _accReqUrl = '/accrequest';

class AccessRequestRepo {
  Future<AccessRequest> save(AccessRequest accessRequest) async {
    final String encodedJson = jsonEncode(
      accessRequest.toJson(),
    );
    final Response response = await client
        .post(
          mainUrl + _accReqUrl,
          headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
          },
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 201) {
      return AccessRequest.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }
}
