/*
 * @Description: api返回结果拦截器
 * @Author: iamsmiling
 * @Date: 2021-09-03 15:39:38
 * @LastEditTime: 2022-02-07 16:09:48
 */
part of http;

class ApiResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data.isEmpty) {
      handler.next(response);
      return;
    }
    try {
      String? code = response.data["code"];
      String? msg = response.data["msg"];
      if (code == ApiCode.success.code) {
        // response.data = response.data['data'];
        handler.next(response);
        return;
      }
      if (code == ApiCode.unlogin.code) {
        // handler.reject(UnauthorisedException(code, msg ?? "未登录"));
        handler.reject(DioError(
            requestOptions: response.requestOptions,
            error: UnauthorisedException(
                ApiCode.unlogin.code, msg ?? "未登录", response)));
        return;
      }
      if (code == ApiCode.notAllowed.code) {
        ToastUtil.error(msg ?? "请联系管理员授权");
        // handler.reject(UnauthorisedException(code, msg ?? "未登录"));
        handler.reject(DioError(
            requestOptions: response.requestOptions,
            error: NotAllowedException(
                code: ApiCode.notAllowed.code,
                message: msg ?? "未登录",
                response: response)));
        return;
      }
      if (code != ApiCode.success.code) {
        ToastUtil.error(msg ?? "未知错误");
        handler.reject(DioError(
            requestOptions: response.requestOptions,
            error: UnkonwException(
                ApiCode.success.code, msg ?? "未知错误", response)));
        return;
      }
    } catch (err, s) {
      handler.reject(
          DioError(requestOptions: response.requestOptions, error: err));
      print(s);
    }
  }
}
