import '../../domain/entities/entity.dart';
import '../../domain/repositories/repositori.dart';
import '../datasource/datasource.dart';

class UserSessionInfoRepositoryImpl extends UserSessionInfoRepository {
  UserSessionInfoDataSouce dataSouce;
  UserSessionInfoRepositoryImpl({required this.dataSouce});

  @override
  Future<UserSessionInfoResponseEntity> userSession(
    String? vIdWebClient,
    String? vToken,
  ) async {
    return await dataSouce.userSession(vIdWebClient, vToken);
  }

  @override
  Future<GetDesmaterializationRerportToWebResponseEntity>
  getDesmaterializationRerportToWeb(
    String codeOperation,
    String? vToken,
  ) async {
    return await dataSouce.getDesmaterializationRerportToWeb(
      codeOperation,
      vToken,
    );
  }
}
