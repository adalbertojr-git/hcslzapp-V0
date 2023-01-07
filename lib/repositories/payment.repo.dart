import 'dart:convert';
import 'dart:io';
import 'package:hcslzapp/models/payment.dart';
import 'package:http/http.dart';
import '../common/injection.dart';
import '../common/settings.dart';
import 'package:hcslzapp/http/http.exception.dart';

import '../models/token.dart';

const String _paymentUrl = '/payment';

class PaymentRepo {
  Future<List<Payment>> findAll() async {
    try {
      final Response response = await client.get(
        Uri.parse(mainUrl + _paymentUrl + "/list"),
        headers: {
          'Content-type': 'application/json',
          HttpHeaders.authorizationHeader: locator.get<Token>().token,
        },
      ).timeout(
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
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Payment>> findByAssociatedIdToList(int id) async {
    try {
      final Response response = await client.get(
        Uri.parse(mainUrl + _paymentUrl + '/list/' + id.toString()),
        headers: {
          'Content-type': 'application/json',
          HttpHeaders.authorizationHeader: locator.get<Token>().token,
        },
      ).timeout(
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
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Payment> save(Payment payment) async {
    try {
      final String encodedJson = jsonEncode(
        payment.toJson(),
      );
      final Response response = await client
          .post(
            Uri.parse(mainUrl + _paymentUrl),
            headers: {
              'Content-type': 'application/json',
              HttpHeaders.authorizationHeader: locator.get<Token>().token,
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
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Payment> update(Payment payment) async {
    try {
      final String encodedJson = jsonEncode(
        payment.toJson(),
      );
      final Response response = await client
          .put(
            Uri.parse(
                mainUrl + _paymentUrl + "/update/" + payment.id.toString()),
            headers: {
              'Content-type': 'application/json',
              HttpHeaders.authorizationHeader: locator.get<Token>().token,
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
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<Response> deleteById(Payment payment) async {
    try {
      final Response response = await client.delete(
        Uri.parse(mainUrl + _paymentUrl + "/" + payment.id.toString()),
        headers: {
          'Content-type': 'application/json',
          HttpHeaders.authorizationHeader: locator.get<Token>().token,
        },
      ).timeout(
        Duration(seconds: 10),
      );
      if (response.statusCode == 204) {
        return response;
      } else {
        throw HttpException(getMessage(response));
      }
    } catch (_) {
      rethrow;
    }
  }
}
