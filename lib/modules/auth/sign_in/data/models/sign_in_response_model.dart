import '../../domain/entities/entities.dart';

class SignInResponseModel extends SignInResponseEntity {
  SignInResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        data: UserSignInResponseModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class UserSignInResponseModel extends UserSignResponseEntity {
  UserSignInResponseModel({
    required super.success,
    required super.userId,
    required super.role,
    required super.token,
    required super.error,
    required super.aditionalItems,
  });

  factory UserSignInResponseModel.fromJson(Map<String, dynamic> json) =>
      UserSignInResponseModel(
        success: json["success"],
        userId: json["userId"],
        role: json["role"],
        token: json["token"],
        error: json["error"],
        aditionalItems: List<AditionalItemEntity>.from(
          json["aditionalItems"].map((x) => AditionalItem.fromJson(x)),
        ),
      );
}

class AditionalItem extends AditionalItemEntity {
  AditionalItem({required super.key, required super.value});

  factory AditionalItem.fromJson(Map<String, dynamic> json) =>
      AditionalItem(key: json["key"], value: json["value"]);

  Map<String, dynamic> toJson() => {"key": key, "value": value};
}
