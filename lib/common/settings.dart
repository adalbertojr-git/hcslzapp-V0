import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import '../http/logging.Interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

/*
URL base de acesso, a partir da qual sao chamadas as demais URls
*/
// no TRE
//const String mainUrl = 'http://10.11.152.202:8080';
// em casa
const String mainUrl = 'http://192.168.122.1:8080';
// via wifi celular
//const String mainUrl = 'http://192.168.43.8:8080';

String getMessage(int statusCode) {
  if(_statusCodeResponses.containsKey(statusCode)){
    return _statusCodeResponses[statusCode];
  }
  return 'unknown error';
}

final Map<int, String> _statusCodeResponses = {
  400: 'Erro na transação devido a informações inválidas no formulário',
  401: 'Falha na autenticação do usuário',
  404: 'Pagina web não encontrada',
  405: 'Método (GET, POST, etc) requisitado não suportado',
  409: 'Erro de conflito pois o arquivo já existe'
};