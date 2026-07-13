import 'package:online_exam_app/config/base_state/base_state.dart';
import 'package:online_exam_app/features/auth/domain/entity/response/auth_response.dart';
class AuthState{

  BaseState<AuthResponse>? loginState ;

  BaseState<AuthResponse>? registerState ;

  AuthState({
    this.loginState,
    this.registerState,
  }) {
    loginState =loginState ??  BaseState<AuthResponse>( isLoading:  true);
    registerState= registerState ??  BaseState<AuthResponse>( isLoading:  true);
  }

 AuthState copyWith(
      {
        BaseState<AuthResponse>? registerState,
        BaseState<AuthResponse>? loginState,
      }) =>
      AuthState(
        loginState: loginState ?? this.loginState,
        registerState:  registerState ?? this.registerState,

      );

}