import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<Dio> authDio(BuildContext context) async {
  var dio = Dio();

  final storage = new FlutterSecureStorage();

  dio.interceptors.clear();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {

    // 기기에 저장된 AccessToken 로드
    final accessToken = await storage.read(key: "ACCESS_TOKEN");

    // 매 요청마다 헤더에 AccessToken 포함
    options.headers["Authorization"] = "Bearer $accessToken";
    return handler.next(options);

  }, onError: (error, handler) async {

  // 인증 오류가 발생했을 경우 : AccessToken 만료
  if(error.response?.statusCode == 401){

  // 기기에 저장된 AccessToken 과 RefreshToken 로드
  final accessToken = await storage.read(key: "ACCESS_TOKEN");
  final refreshToken = await storage.read(key: "REFRESH_TOKEN");

  // 토근 갱신 요청을 담당할 dio 객체 구현 후 그에따른 interceptor 정의
  var refreshDio = Dio();

  refreshDio.interceptors.clear();

  refreshDio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {

  // 다시 인증 오류가 발생했을 경우 : RefreshToken 만료
  if(error.response?.statusCode == 401){

  // 기기의 자동 로그인 정보 삭제
  await storage.deleteAll();

  //로그인 만료 알림 후 로그인 페이지로 이동
  //

  }
  return handler.next(error);
  }));

  // 토근 갱신 API 요청시 AccessToken : 만료, RefreshToken : 포함
  refreshDio.options.headers["Authorization"] = "Bearer $accessToken";
  refreshDio.options.headers["Refresh"] = "Bearer $refreshToken";

  // 토근 갱신 API 요청
  final refreshResponse = await refreshDio.get("/token/refresh");

  // response 로부터 새로 갱신된 AccessToken 과 RefreshToken 파싱
  final newAccessToken = refreshResponse.headers["Authorization"]![0];
  final newRefreshToken = refreshResponse.headers["Refresh"]![0];

  // 기기에 저장된 AccessToken 과 RefreshToken 갱신
  await storage.write(key: "ACCESS_TOKEN", value: newAccessToken);
  await storage.write(key: "REFRESH_TOKEN", value: newRefreshToken);

  // AccessToken 의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
  error.requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

  // 수행하지 못했던 API 요청 복사본 생성
  final clonedRequest = await dio.request(error.requestOptions.path,
  options: Options(
  method: error.requestOptions.method,
  headers: error.requestOptions.headers),
  data: error.requestOptions.data,
  queryParameters: error.requestOptions.queryParameters);

  // API 복사본으로 재요청
  return handler.resolve(clonedRequest);
  }

  return handler.next(error);
  }));
  return dio;
}
