import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
/*    print('---------- Request ---------- ');
    print('url: ${data.url}');
    print('body: ${data.body}');
    print('headers: ${data.headers}');
    print('---------- End Request ---------- ');*/
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
/*    print('---------- Response ---------- ');
    print('status code: ${data.statusCode}');
    print('body: ${data.body}');
    print('headers: ${data.headers}');
    print('---------- End Response ---------- ');*/
    return data;
  }
}