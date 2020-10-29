/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que faz as chamadas aos metodos da Web API

*/
import 'dart:convert';
import 'package:hcslzapp/models/payment.dart';
import 'package:http/http.dart';
import '../settings.dart';

/*
endereço URL da classe alvo
*/
const String _paymentUrl = '/mensalidades';

class PaymentRepo {
/*
retorna lista de todos as mensalidades pagas
*/
  Future<List<Payment>> findAll() async {
    final Response response =
        await client.get(mainUrl + _paymentUrl).timeout(Duration(seconds: 10));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Payment.fromJson(json))
        .toList();
  }

/*
retorna lista com as mensalidades do associado especificado
params:
codigo: codigo do associado
*/
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
