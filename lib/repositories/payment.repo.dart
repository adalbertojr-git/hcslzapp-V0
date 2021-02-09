import 'dart:convert';
import 'package:hcslzapp/models/payment.dart';
import 'package:http/http.dart';
import '../common/settings.dart';
import 'package:hcslzapp/http/http.exception.dart';

const String _paymentUrl = '/payment';

class PaymentRepo {
  Future<List<Payment>> findAll() async {
    final Response response = await client
        .get(
          mainUrl + _paymentUrl + "/list",
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

  Future<List<Payment>> findByAssociatedIdToList(int id) async {
    final Response response = await client
        .get(
          mainUrl + _paymentUrl + '/list/' + id.toString(),
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
          mainUrl + _paymentUrl,
          headers: {
            'Content-type': 'application/json',
          },
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    print(payment);
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
          mainUrl + _paymentUrl + "/update/" + payment.id.toString(),
          headers: {
            'Content-type': 'application/json',
          },
          body: encodedJson,
        )
        .timeout(
          Duration(seconds: 10),
        );
    print(payment);
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
      mainUrl + _paymentUrl + "/" + payment.id.toString(),
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
  }
}
