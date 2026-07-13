import 'package:online_exam_app/features/auth/domain/entity/response/auth_response.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/request/login/login_request.dart';
import '../entity/request/register/register_request.dart';

abstract class AuthRepo {
  Future<BaseResponse<AuthResponse>> login(LoginRequest loginRequest);
  Future<BaseResponse<AuthResponse>> register(RegisterRequest registerRequest);

}