import 'package:dio/dio.dart';

import '../local/storagehelper.dart';



class CustomInterceptor extends Interceptor with StorageHelper {
@override
void onRequest(
    RequestOptions options, RequestInterceptorHandler handler) async {
  String? token = await getToken();
  String? lang = await getLang();


  options.headers['lang'] = lang;
  options.headers['Accept'] ="application/json";
  if(token!=null) {
      options.headers['Authorization'] = "Bearer $token";
      return handler.next(options);

  }
  return handler.next(options);
}
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {}
}
