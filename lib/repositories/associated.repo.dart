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
import '../settings.dart';

/*
endereço URL da classe alvo
*/
const String _associatedUrl = '/associados';

class AssociatedRepo {
/*
retorna lista de todos os associados
*/
  Future<List<Associated>> findAll() async {
    final Response response =
        await client.get(mainUrl + _associatedUrl).timeout(Duration(seconds: 10));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Associated.fromJson(json)).toList();
  }

/*
retorna lista com o associado especificado
params:
codigo: codigo do associado
*/
  Future<List<Associated>> findByCodigo(int codigo) async {
    final Response response = await client
        .get(mainUrl + _associatedUrl + '/' + codigo.toString())
        .timeout(Duration(seconds: 10));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Associated.fromJson(json)).toList();
  }
}
