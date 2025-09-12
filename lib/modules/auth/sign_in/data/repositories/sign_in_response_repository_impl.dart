import 'package:app_prodem_v1/modules/auth/sign_in/data/datasource/sign_in_datasource.dart';
import 'package:app_prodem_v1/modules/auth/sign_in/domain/repositories/sign_in_response_repository.dart';

import '../../domain/entities/entities.dart';

class SignInResponseRepositoryImpl extends SignInResponseRepository {
  SignInDatasource datasource;

  SignInResponseRepositoryImpl({required this.datasource});
  @override
  Future<SignInResponseEntity> signIn(
    String username,
    String password,
    int chanel,
    List aditionalItems,
  ) async {
    return await datasource.signIn(username, password, chanel, aditionalItems);
  }
}
