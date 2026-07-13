import 'package:dio/dio.dart';

import '../../core/constants/error_constants.dart';

class ErrorExtractors {
  ErrorExtractors._();
  static String extractErrorMessage(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.transformTimeout:
          return 'Connection timeout, please try again.';
        case DioExceptionType.connectionError:
          return 'No internet connection, please check your network.';
        case DioExceptionType.badCertificate:
          return 'Invalid certificate, please try again later.';
        case DioExceptionType.cancel:
          return 'Request was cancelled.';
        case DioExceptionType.badResponse:
          return _extractServerMessage(error.response?.statusCode,error.response?.data);
        default:
          return 'Something went wrong, please check your connection.';
      }
    } else {
      return ErrorConstants.somethingWentWrong;
    }
  }

  static String _extractServerMessage(int? statusCode, dynamic data) {
    // switch (statusCode) {
    //   case 400:
    //   case 401:
    //   case 403:
    //   case 404:
    //   case 409:
    //     return 'Something went wrong, please try again.';
    //   case 422:
    //     return 'No Data Found. ';
    //   case 500:
    //   case 502:
    //   case 503:
    //     return 'Internal server error, please try again later.';
    //   default:
    //     return 'Something went wrong, please try again.';
    // }
    /////////////
    String message = ErrorConstants.somethingWentWrong;
    if(data is Map ){
       message = data['message']?? message;
    }
    return message;
  }
}