import 'package:dio/dio.dart';
import 'package:mod_game/utils/logger/logger.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // final options = err.requestOptions;
    // final requestPath = '${options.baseUrl}${options.path}';
    // Logger.e('${options.method} request ==> $requestPath'); //Error log
    Logger.e('Error type: ${err.error}\n'
        'Error message: ${err.message}'); //Debug log

    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    Logger.i('${options.method} request ==> $requestPath'); //Info log

    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.d('Status Code: ${response.statusCode}\n'
        'Status Message: ${response.statusMessage}\n'
        'Data: ${response.data}'); // Debug log

    handler.next(response); // continue with the Response
  }
}
