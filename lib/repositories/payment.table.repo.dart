import 'dart:convert';
import 'package:hcslzapp/models/payment.table.dart';
import 'package:http/http.dart';
import '../common/settings.dart';
import 'package:hcslzapp/http/http.exception.dart';

const String _paymentUrl = '/paymentstable';

class PaymentTableRepo {
  Future<List<PaymentTable>> findAll() async {
    try {
      final Response response = await client
          .get(
            Uri.parse(mainUrl + _paymentUrl + "/list"),
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
    } catch (_) {
      rethrow;
    }
  }
}
