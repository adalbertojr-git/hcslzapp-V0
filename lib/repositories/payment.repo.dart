import 'dart:convert';
import 'package:hcslzapp/models/payment.dart';
import 'package:http/http.dart';
import '../common/settings.dart';

const String _paymentUrl = '/mensalidades';

class PaymentRepo {

  Future<List<Payment>> findAll() async {
    final Response response =
        await client.get(mainUrl + _paymentUrl).timeout(Duration(seconds: 10));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Payment.fromJson(json))
        .toList();
  }

  Future<List<Payment>> findByAssociado_Codigo(int codigo) async {
    final Response response = await client
        .get(mainUrl + _paymentUrl + '/' + codigo.toString())
        .timeout(Duration(seconds: 10));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Payment.fromJson(json))
        .toList();
  }
}
