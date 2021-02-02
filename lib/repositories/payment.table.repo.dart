import 'dart:convert';
import 'package:hcslzapp/models/payment.table.dart';
import 'package:http/http.dart';
import '../common/settings.dart';
import 'package:hcslzapp/http/http.exception.dart';

const String _paymentUrl = '/tablepayment';

class PaymentTableRepo {
  Future<List<PaymentTable>> findAll() async {
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
            (dynamic json) => PaymentTable.fromJson(json),
          )
          .toList();
    } else {
      throw HttpException(getMessage(response.statusCode));
    }
  }
}
