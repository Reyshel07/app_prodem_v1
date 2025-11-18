import '../entities/entity.dart';

abstract class WebPersonDeviceAuthenticatePrKeyRepository {
  Future<WebPersonDeviceAuthenticateProdemKeyResponseEntity>
  webPersonDeviceAuthenticateProdemKey(
    String deviceIMEI,
    String userName,
    String customerPIN,
    bool verifyPIN,
    String? vToken,
  );
}
