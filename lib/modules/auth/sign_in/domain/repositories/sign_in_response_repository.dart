import 'package:app_prodem_v1/modules/auth/sign_in/domain/entities/entities.dart';

abstract class SignInResponseRepository {
  Future<SignInResponseEntity> signIn(
    String username,
    String password,
    int chanel,
    List<AditionalItemEntity> aditionalItems,
  );
}
