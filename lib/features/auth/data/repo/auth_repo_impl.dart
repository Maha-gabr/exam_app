import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/domain/entity/request/login/login_request.dart';
import 'package:online_exam_app/features/auth/domain/entity/request/register/register_request.dart';
import 'package:online_exam_app/features/auth/domain/entity/response/auth_response.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../config/services/secure_storage_service.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/remote/auth_remote_data_source.dart';
import '../models/response/auth_response_dto.dart';
@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo{
  final AuthRemoteDataSource _authRemoteDataSource;
  final SecureStorageService _secureStorageService;
  const AuthRepoImpl(this._authRemoteDataSource, this._secureStorageService);

  @override
  Future<BaseResponse<AuthResponse>> login(LoginRequest loginRequest) async {
   final BaseResponse<AuthResponseDto> authResponse= await _authRemoteDataSource.login(loginRequest.toDto());

   switch (authResponse) {
     case SuccessResponse<AuthResponseDto>():
       final AuthResponse authResponseEntity = authResponse.data.toDomain();
       _secureStorageService.saveToken(authResponseEntity.token??'');
       return SuccessResponse<AuthResponse>(authResponseEntity);

     case ErrorResponse<AuthResponseDto>():
       return ErrorResponse<AuthResponse>(
         errMessage: authResponse.errMessage,
       );
   }

    // savetoken
    //check for internet connection X
    //make function call from datasource
    //2 cases (success, error) X
    //cache productDto list X
    //convert dto list to entity list
    //return products entity list
  }



  @override
  Future<BaseResponse<AuthResponse>> register(RegisterRequest registerRequest) async {
    final BaseResponse<AuthResponseDto> authResponse= await _authRemoteDataSource.register(registerRequest.toDto());

    switch (authResponse) {
      case SuccessResponse<AuthResponseDto>():
        final AuthResponse authResponseEntity = authResponse.data.toDomain();
        _secureStorageService.saveToken(authResponseEntity.token??'');
        return SuccessResponse<AuthResponse>(authResponseEntity);

      case ErrorResponse<AuthResponseDto>():
        return ErrorResponse<AuthResponse>(
          errMessage: authResponse.errMessage,
        );
    }

    // save token
    //check for internet connection X
    //make function call from datasource
    //2 cases (success, error) X
    //cache productDto list X
    //convert dto list to entity list
    //return products entity list
  }


}