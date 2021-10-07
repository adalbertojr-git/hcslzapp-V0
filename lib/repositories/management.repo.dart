import 'dart:async';
import 'dart:convert';
import 'package:hcslzapp/http/http.exception.dart';
import 'package:hcslzapp/models/access.request.dart';
import 'package:hcslzapp/models/associated.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _accReqUrl = '/management';

class ManagementRepo {

  Future<Response> save(List<int> ids) async {
    final String encodedJson = jsonEncode(
      ids,
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
    if (response.statusCode == 200) {
      return response;
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }
/*
  Future<Response> deleteById(AccessRequest accessRequest) async {
    final String encodedJson = jsonEncode(
      accessRequest.toJson(),
    );
    final Response response = await client.delete(
      mainUrl + _accReqUrl + "/" + accessRequest.id.toString(),
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
  }*/
}
