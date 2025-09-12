class SignInResponseEntity {
  final UserSignResponseEntity data;
  final int state;
  final String message;

  SignInResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class UserSignResponseEntity {
  final bool success;
  final String userId;
  final String role;
  final String token;
  final String error;
  final List<AditionalItemEntity> aditionalItems;

  UserSignResponseEntity({
    required this.success,
    required this.userId,
    required this.role,
    required this.token,
    required this.error,
    required this.aditionalItems,
  });
}

class AditionalItemEntity {
  final String key;
  final String value;

  AditionalItemEntity({required this.key, required this.value});
}
