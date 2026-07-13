import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/domain/entity/response/auth_response.dart';
import '../../../../config/base_response/base_response.dart';
import '../entity/request/register/register_request.dart';
import '../repo/auth_repo.dart';
@lazySingleton
class RegisterUseCase {
  final AuthRepo _authRepo;
  const RegisterUseCase(this._authRepo);

  Future<BaseResponse<AuthResponse>> call(RegisterRequest registerRequest) async {
    return await _authRepo.register(registerRequest);


  }



}