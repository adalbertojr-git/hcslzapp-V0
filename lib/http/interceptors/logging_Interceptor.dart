/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que permite interceptar os diferentes pedidos e respostas do
pacote http do Dart. Você pode usar para adicionar cabeçalhos, modificar
parâmetros de consulta ou imprimir um log da resposta.

*/
import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
/*    print('---------- Request ---------- ');
    print('url: ${data.url}');
    print('body: ${data.body}');
    print('headers: ${data.headers}');
    print('---------- End Request ---------- ');*/
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
/*    print('---------- Response ---------- ');
    print('status code: ${data.statusCode}');
    print('body: ${data.body}');
    print('headers: ${data.headers}');
    print('---------- End Response ---------- ');*/
    return data;
  }
}