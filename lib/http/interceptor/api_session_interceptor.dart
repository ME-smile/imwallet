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
    BearerTokenModel? bearerToken =
        json == null ? null : BearerTokenModel.fromJson(json);
    Map? userJson = SpUtil.getJson(SpKey.user);
    UserProfileModel? user =
        userJson == null ? null : UserProfileModel.fromJson(userJson);
    if (bearerToken != null) {
      options.headers.addAll({"Authorization": 'Bearer ${bearerToken.token}'});
    }
    if (user != null) {
      options.queryParameters.addAll({'userId': user.id});
      if (options.data is Map) {
        options.data.addAll({'userId': '${user.id}'});
      }
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
