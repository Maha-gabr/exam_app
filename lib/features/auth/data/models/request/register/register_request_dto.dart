import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/request/register/register_request.dart';

part 'register_request_dto.g.dart';

@JsonSerializable()
class RegisterRequestDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "phone")
  final String? phone;

  RegisterRequestDto ({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestDtoToJson(this);
  }

  RegisterRequest toDomain(){
    return RegisterRequest(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}


