/*
Autor: Adalberto Jr.
App: HCSlz
Todos os direitos reservados ao Harley Club de Sao Luis
2020

Descriçao: classe que faz as chamadas aos metodos da Web API

*/
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../interceptors/logging.Interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [
    LoggingInterceptor(),
  ],
);

/*
URL base de acesso, a partir da qual sao chamadas as demais URls
*/
const String baseUrl = 'http://192.168.0.17:8080';
