import 'package:http/http.dart';

class HttpException implements Exception {
  final String? message;

  HttpException(this.message);

  @override
  String toString() {
    return this.message!;
  }
}

String? getMessage(int statusCode) {
  if(_statusCodeResponses.containsKey(statusCode)){
    return _statusCodeResponses[statusCode];
  }
  return 'Erro desconhecido: ' + statusCode.toString();
}

String? getMessage2(Response response) {
  String err = response.body.substring(
      response.body.indexOf('["', 0) + 2,
      response.body.indexOf(
        '"]',
        0,
      ));
  print(err);
  int code = 0;
  if (err.contains('JWT', 0)) code = 999;
  else code = response.statusCode;
  if (_statusCodeResponses.containsKey(code)) {
    return _statusCodeResponses[code];
  }
  return 'Houve um erro inesperado na aplicação: ' + response.statusCode.toString();
}

final Map<int, String> _statusCodeResponses = {
  //erros no cliente
  400: 'Erro devido a informações inválidas no formulário',
  401: 'Erro na autenticação do usuário',
  403: 'Erro na autenticação do usuário',
  404: 'Pagina web não encontrada',
  405: 'Método HTTP requisitado não suportado',
  408: 'Tempo de requisição esgotado (Timeout)',
  409: 'Erro de conflito: ',
  //erros no servidor
  500: 'Internal Server Error',
  502: 'Bad Gateway',
  503: 'Service Unavailable',
  504: 'Gateway Time-Out',
  505: 'HTTP Version not supported',
  //custom
  999: 'Sua sessão expirou. Reconecte a aplicação'
};