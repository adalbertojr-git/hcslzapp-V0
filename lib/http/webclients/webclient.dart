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
// no TRE
//const String mainUrl = 'http://192.168.15.218:8080';
//const String mainUrl = 'http://10.11.152.48:8080';
// em casa
const String mainUrl = 'http://192.168.0.21:8080';
