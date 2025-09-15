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
  ) async {
    return await datasource.signIn(username, password, chanel, aditionalItems);
  }
}
