import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/auth/api/client/auth_api_client.dart';

// @module
// abstract class DioModule {
//   @singleton
//   Dio get dio => Dio(
//     BaseOptions(
//       baseUrl: ApiConstants.baseUrl,
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//     ),
//   );
// }



@module
abstract class GitItModule {
  @singleton
  BaseOptions get provideBaseOptions => BaseOptions(
    baseUrl:  ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  @singleton
  PrettyDioLogger get providePrettyDioLogger => PrettyDioLogger(
      request: true,
      error: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true
  );

  @singleton
  Dio get provideDio{
    var dio = Dio(
        provideBaseOptions
    );
    dio.interceptors.add(providePrettyDioLogger);
    return dio;
  }



  @singleton
  AuthApiClient get provideApiServices => AuthApiClient(provideDio);

}