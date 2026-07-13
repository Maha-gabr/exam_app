import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entity/request/login/login_request.dart';
import 'package:online_exam_app/features/auth/domain/entity/response/auth_response.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';
@lazySingleton
class LoginUseCase {
  final AuthRepo _authRepo;
 const LoginUseCase(this._authRepo);

  Future<BaseResponse<AuthResponse>> call(LoginRequest loginRequest) async {
   return await _authRepo.login(loginRequest);


 }



}