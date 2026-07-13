import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/models/request/login/login_request_dto.dart';
import 'package:online_exam_app/features/auth/data/models/request/register/register_request_dto.dart';
import 'package:online_exam_app/features/auth/data/models/response/auth_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<AuthResponseDto>> login(LoginRequestDto loginRequestDto);
  Future<BaseResponse<AuthResponseDto>> register(RegisterRequestDto registerRequestDto);
}