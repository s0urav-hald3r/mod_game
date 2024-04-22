import 'package:dio/dio.dart';

import '../../utils/constants/api_constants.dart';
import '../../utils/constants/enums.dart';
import '../../utils/local_storage/local_storage.dart';

/// This interceptor add "Authorization" header and then, send it to the [API]
class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // adds the access-token with the header
    if (XLocalStorage.isDataAvailable(XApiConstant.jwtToken)) {
      String token = XLocalStorage.getData(XApiConstant.jwtToken, KeyType.STR);
      options.headers[XApiConstant.authorization] = 'Bearer $token';
    }

    handler.next(options); // continue with the request
  }
}
