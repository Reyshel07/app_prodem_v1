import '../entities/entity.dart';

abstract class GetPafDataForMobileAppRepository {
  Future<GetPafDataForMobileAppResponseEntity> getPafDataForMobileApp(
    String? vToken,
  );
}
