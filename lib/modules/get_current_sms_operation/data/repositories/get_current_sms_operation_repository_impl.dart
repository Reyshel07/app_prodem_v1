import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GetCurrentSmsOperationRepositoryImpl
    extends GetCurrentSmsOperationRepository {
  GetCurrentSmsOperationDatasource datasource;
  GetCurrentSmsOperationRepositoryImpl({required this.datasource});

  @override
  Future<GetCurrentSmsOperationResponseEntity> getCurrentSmsOperation(
    String? vToken,
    String idWebUser,
  ) async {
    return await datasource.getCurrentSmsOperation(vToken, idWebUser);
  }
}
