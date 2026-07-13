class AuthResponse {
  final String? message;
  final String? token;
  final User? user;

  const AuthResponse({
    this.message,
    this.token,
    this.user,
  });
}

class User {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? id;
  final String? createdAt;

  const User({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });
}