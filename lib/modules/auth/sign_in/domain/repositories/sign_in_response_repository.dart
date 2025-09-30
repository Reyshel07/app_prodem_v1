import '../entities/entities.dart';

abstract class SignInResponseRepository {
  Future<SignInResponseEntity> signIn(
    String username,
    String password,
    int chanel,
    List<AditionalItemEntity> aditionalItems,
    String ip,String  imei
  );
}
