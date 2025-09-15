import '../entities/entity.dart';

abstract class UserSessionInfoRepository {
  Future<UserSessionInfoResponseEntity> userSession();
}
