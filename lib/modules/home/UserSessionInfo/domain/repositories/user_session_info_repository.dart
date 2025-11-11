import '../entities/entity.dart';

abstract class UserSessionInfoRepository {
  Future<UserSessionInfoResponseEntity> userSession(
    String? vIdWebClient,
    String? vToken,
  );
  Future<GetDesmaterializationRerportToWebResponseEntity>
  getDesmaterializationRerportToWeb(String codeOperation, String? vToken);
}
