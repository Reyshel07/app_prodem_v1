import '../entities/entity.dart';

abstract class GetCurrentQrByTypeRepository {
  Future<GetCurrentQrByTypeResponseEntity> currentQrByType(String? vToken);
}
