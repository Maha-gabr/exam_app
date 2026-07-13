import '../../../../data/models/request/login/login_request_dto.dart';

class LoginRequest {
  final String? email;
  final String? password;

  const LoginRequest({
    this.email,
    this.password,
  });

  LoginRequestDto toDto(){
    return LoginRequestDto(
      email: email,
      password: password,
    );
  }
}