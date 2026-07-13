import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:online_exam_app/features/auth/data/models/request/register/register_request_dto.dart';
import 'package:online_exam_app/features/auth/data/models/response/auth_response_dto.dart';
import '../../client/auth_api_client.dart';
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient _authApiClient;

  const AuthRemoteDataSourceImpl(this._authApiClient);

  @override
  Future<BaseResponse<AuthResponseDto>> login(
      LoginRequestDto loginRequestDto) async {
    try {
      AuthResponseDto authResponse = await _authApiClient.login(
          loginRequestDto);
      return SuccessResponse<AuthResponseDto>(authResponse);
    } on Exception catch (e) {
      return ErrorResponse<AuthResponseDto>(error: e);
    }
  }

  @override
  Future<BaseResponse<AuthResponseDto>> register(
      RegisterRequestDto registerRequestDto) async {
    try {
      AuthResponseDto authResponse = await _authApiClient.register(
          registerRequestDto);
      return SuccessResponse<AuthResponseDto>(authResponse);
    } on Exception catch (e) {
      return ErrorResponse<AuthResponseDto>(error: e);
    }
  }

}
