import '../../domain/entities/entity.dart';
import '../../domain/repositories/web_person_device_authenticate_pr_key_repository.dart';
import '../datasource/datasource.dart';

class WebPersonDeviceAuthenticatePrRepositoryImpl
    extends WebPersonDeviceAuthenticatePrKeyRepository {
  WebPersonDeviceAuthenticatePrKyDatasource datasource;
  WebPersonDeviceAuthenticatePrRepositoryImpl({required this.datasource});

  @override
  Future<WebPersonDeviceAuthenticateProdemKeyResponseEntity>
  webPersonDeviceAuthenticateProdemKey(
    String deviceIMEI,
    String userName,
    String customerPIN,
    bool verifyPIN,
    String? vToken,
  ) async {
    return await datasource.webPersonDeviceAuthenticateProdemKey(
      deviceIMEI,
      userName,
      customerPIN,
      verifyPIN,
      vToken,
    );
  }
}
