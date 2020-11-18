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
const String mainUrl = 'http://10.11.152.202:8080';
// em casa
//const String mainUrl = 'http://192.168.0.21:8080';
// via wifi celular
//const String mainUrl = 'http://192.168.43.8:8080';

String getMessage(int statusCode) {
  if(_statusCodeResponses.containsKey(statusCode)){
    return _statusCodeResponses[statusCode];
  }
  return 'unknown error';
}

final Map<int, String> _statusCodeResponses = {
  400: 'there was an error submitting transaction',
  401: 'authentication failed',
  409: 'transaction already exists'
};