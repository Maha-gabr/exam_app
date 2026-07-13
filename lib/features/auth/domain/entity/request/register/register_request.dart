import 'package:online_exam_app/features/auth/data/models/request/register/register_request_dto.dart';

class RegisterRequest {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  const RegisterRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

 RegisterRequestDto toDto(){
   return RegisterRequestDto(
      username: username,
     firstName: firstName,
     lastName: lastName,
     email: email,
     password: password,
     rePassword: rePassword,
     phone: phone

   );

  }
}