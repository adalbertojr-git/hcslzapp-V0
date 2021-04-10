import 'dart:convert';
import 'package:hcslzapp/models/event.dart';
import 'package:http/http.dart';
import '../common/settings.dart';
import 'package:hcslzapp/http/http.exception.dart';

const String _eventUrl = '/event';

class EventRepo {
  Future<List<Event>> findAll() async {
    final Response response = await client
        .get(
          mainUrl + _eventUrl + "/list",
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson
          .map(
            (dynamic json) => Event.fromJson(json),
          )
          .toList();
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }
/*
  Future<List<Payment>> findByAssociatedIdToList(int id) async {
    final Response response = await client
        .get(
          mainUrl + _eventUrl + '/list/' + id.toString(),
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);
      return decodedJson
          .map(
            (dynamic json) => Payment.fromJson(json),
          )
          .toList();
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<Payment> save(Payment payment) async {
    final String encodedJson = jsonEncode(
      payment.toJson(),
    );
    final Response response = await client
        .post(
          mainUrl + _eventUrl,
          headers: {
            'Content-type': 'application/json',
          },
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      return Payment.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<Payment> update(Payment payment) async {
    final String encodedJson = jsonEncode(
      payment.toJson(),
    );
    final Response response = await client
        .put(
          mainUrl + _eventUrl + "/update/" + payment.id.toString(),
          headers: {
            'Content-type': 'application/json',
          },
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    if (response.statusCode == 200) {
      return Payment.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }

  Future<Response> deleteById(Payment payment) async {
    final String encodedJson = jsonEncode(
      payment.toJson(),
    );
    final Response response = await client.delete(
      mainUrl + _eventUrl + "/" + payment.id.toString(),
      //mainUrl + _paymentUrl ,
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
