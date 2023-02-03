import 'package:http/http.dart';

class HttpException implements Exception {
  final String? message;

  HttpException(this.message);

  @override
  String toString() {
    return this.message!;
  }
}

String? getMessage(Response response) {
  int code = 0;
  String err = response.body.toString();
  if (err.contains('JWT expire', 0))
    code = 4011;
  else if (response.statusCode == 409 && err.contains('User', 0))
    code = 4091;
  else if (response.statusCode == 409 && err.contains('Email', 0))
    code = 4092;
  else
    code = response.statusCode;
  if (_statusCodeResponses.containsKey(code)) {
    return _statusCodeResponses[code];
  }
  return 'Erro inesperado na aplicação:\n Código ' +
      response.statusCode.toString() +
      '\n\n' +
      err;
}

final Map<int, String> _statusCodeResponses = {
  //erros no cliente (browser)
  400: 'Erro devido a informações inválidas no formulário',
  401: 'Erro na autenticação.\n Verifique suas credenciais',
  403: 'Cliente sem acesso ao conteúdo do servidor',
  404: 'Pagina web não encontrada',
  405: 'Método HTTP requisitado não suportado',
  408: 'Tempo de requisição esgotado (Timeout)',
  //erros no servidor
  500: 'Internal Server Error',
  502: 'Bad Gateway',
  503: 'Service Unavailable',
  504: 'Gateway Time-Out',
  505: 'HTTP Version not supported',
  //custom - token expirado
  4011: 'Sua sessão expirou.\n Por favor, reconecte a aplicação',
  4091: 'Usuário já cadastrado',
  4092: 'Email já cadastrado',
};
