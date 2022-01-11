class HttpException implements Exception {
  final String? message;

  HttpException(this.message);
}

String? getMessage(int statusCode) {
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