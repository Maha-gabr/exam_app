import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/constants/api_constants.dart';
import '../../data/models/request/login/login_request_dto.dart';
import '../../data/models/request/register/register_request_dto.dart';
import '../../data/models/response/auth_response_dto.dart';

part 'auth_api_client.g.dart';
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio, {String? baseUrl}) = _AuthApiClient;

  @POST(ApiConstants.register)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequestDto);

  @POST(ApiConstants.login)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequestDto);

}