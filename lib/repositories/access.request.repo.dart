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
          Uri.parse(mainUrl + _accReqUrl),
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
      return AccessRequest.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<List<AccessRequest>> findAll() async {
    final Response response = await client
        .get(
          Uri.parse(mainUrl + _accReqUrl + "/list"),
        )
        .timeout(
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
  }

  Future<Response> check(List<AccessRequest> accessRequests) async {
    final String encodedJson = jsonEncode(
      accessRequests,
    );
    final Response response = await client
        .post(
          Uri.parse(mainUrl + _accReqUrl + "/check"),
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
      return response;
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<Response> deleteById(int id) async {
/*    final String encodedJson = jsonEncode(
      accessRequest.toJson(),
    );*/
    final Response response = await client.delete(
      Uri.parse(mainUrl + _accReqUrl + "/" + id.toString()),
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
