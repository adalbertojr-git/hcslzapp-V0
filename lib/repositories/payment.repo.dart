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

  Future<List<Payment>> findByIdToList(int id) async {
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
}
