import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/response/auth_response.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable()
class AuthResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  AuthResponseDto ({
    this.message,
    this.token,
    this.user,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponseDtoToJson(this);
  }

  AuthResponse toDomain(){
    return AuthResponse(
      message: message,
      token: token,
      user: user?.toDomain(),

    );
  }
}

@JsonSerializable()
class UserDto {
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDto ({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.Id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return _$UserDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDtoToJson(this);
  }
  User toDomain(){
    return User(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      isVerified: isVerified,
      id: Id,
      createdAt: createdAt,
    );
   }

}


