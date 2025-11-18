import '../entities/entity.dart';

abstract class GetCurrentSmsOperationRepository {
  Future<GetCurrentSmsOperationResponseEntity> getCurrentSmsOperation(
    String? vToken,
    String idWebUser,
  );
}
