class HttpException implements Exception {
  final String? message;

  HttpException(this.message);
}

String? getMessage(int statusCode) {
  if(_statusCodeResponses.containsKey(statusCode)){
    return _statusCodeResponses[statusCode];
  }
  return 'Erro desconhecido: ' + statusCode.toString();
}

final Map<int, String> _statusCodeResponses = {
  400: 'Erro devido a informações inválidas no formulário',
  401: 'Erro na autenticação do usuário',
  404: 'Pagina web não encontrada',
  405: 'Método HTTP requisitado não suportado',
  408: 'Tempo de requisição esgotado (Timeout)',
  409: 'Erro de conflito: ',
  500: 'Internal Server Error',
  502: 'Bad Gateway',
  503: 'Service Unavailable',
  504: 'Gateway Time-Out',
  505: 'HTTP Version not supported',
};