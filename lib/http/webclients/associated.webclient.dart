/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que faz as chamadas aos metodos da Web API

*/
import 'dart:convert';

import 'package:hcslzapp/models/associated.dart';
import 'package:http/http.dart';

import 'webclient.dart';

/*
endereço URL da classe alvo
*/
const String moduloUrl = '/associados';

class AssociadoWebClient {
/*
retorna lista de todos os associados
*/
  Future<List<Associado>> findAll() async {
    final Response response =
        await client.get(baseUrl + moduloUrl).timeout(Duration(seconds: 10));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Associado.fromJson(json)).toList();
  }

/*
retorna lista com o associado especificado
params:
codigo: codigo do associado
*/
  Future<List<Associado>> findByCodigo(int codigo) async {
    final Response response = await client
        .get(baseUrl + moduloUrl + '/' + codigo.toString())
        .timeout(Duration(seconds: 10));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Associado.fromJson(json)).toList();
  }
}
