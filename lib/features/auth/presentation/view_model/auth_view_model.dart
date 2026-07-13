import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entity/request/register/register_request.dart';
import '../../domain/entity/request/login/login_request.dart';
import '../../domain/entity/response/auth_response.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/use_case/register_use_case.dart';
import 'auth_states.dart';
@lazySingleton
class AuthViewModel extends Cubit<AuthState>{
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
   AuthViewModel(this._loginUseCase,this._registerUseCase) : super(AuthState());


 Future<void> login(LoginRequest login) async {
    emit(state.copyWith(
        loginState: state.loginState?.copyWith(isLoading: true)));
    final BaseResponse<AuthResponse> authResponse = await _loginUseCase(login);
    switch (authResponse) {
      case SuccessResponse<AuthResponse>():
        // emit(state.copyWith(isLoading: false, authResponse: authResponse.data));
        emit(state.copyWith(
          loginState: state.loginState?.copyWith(isLoading: false, data: authResponse.data)
        ));
      case ErrorResponse<AuthResponse>():
        emit(state.copyWith(
            loginState: state.loginState?.copyWith(isLoading: false, errMessage: authResponse.errMessage)
        ));
        // emit(state.copyWith(isLoading: false, errorMessage: authResponse.errMessage));
}  }

  Future<void> register(RegisterRequest register)async{
   emit(state.copyWith(
     registerState: state.registerState?.copyWith(isLoading: true)
   ));
   final BaseResponse<AuthResponse> authResponse = await _registerUseCase(register);
   switch (authResponse) {
     case SuccessResponse<AuthResponse>():
       emit(state.copyWith(
           registerState: state.registerState?.copyWith(isLoading: false, data: authResponse.data)
       ));
     case ErrorResponse<AuthResponse>():
       emit(state.copyWith(
           registerState: state.registerState?.copyWith(isLoading: false, errMessage: authResponse.errMessage)
       ));
   }

  }


}