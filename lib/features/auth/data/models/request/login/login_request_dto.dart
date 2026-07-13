import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entity/request/login/login_request.dart';

part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;

  LoginRequestDto ({
    this.email,
    this.password,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginRequestDtoToJson(this);
  }

  LoginRequest toDomain(){
    return LoginRequest(
      email: email,
      password: password,
    );
  }
}


