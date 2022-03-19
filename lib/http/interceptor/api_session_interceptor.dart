/*
 * @Description: 日志
 * @Author: iamsmiling
 * @Date: 2021-09-03 15:21:21
 * @LastEditTime: 2021-09-18 14:57:24
 */
part of http;

class ApiSessionInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra["withToken"] != true) return handler.next(options);
    Map? json = SpUtil.getJson(SpKey.token);
    if (json != null) {
      options.headers.addAll(
          {"Authorization": 'Bearer ${BearerTokenModel.fromJson(json).token}'});
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
