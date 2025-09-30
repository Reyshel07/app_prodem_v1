import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasource/datasource.dart';

class SignInResponseRepositoryImpl extends SignInResponseRepository {
  SignInDatasource datasource;

  SignInResponseRepositoryImpl({required this.datasource});
  @override
  Future<SignInResponseEntity> signIn(
    String username,
    String password,
    int chanel,
    List<AditionalItemEntity> aditionalItems,
    String ip, String  imei
  ) async {
    return await datasource.signIn(username, password, chanel, aditionalItems, ip, imei);
  }
}
