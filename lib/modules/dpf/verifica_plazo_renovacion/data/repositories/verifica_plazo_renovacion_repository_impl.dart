import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class VerificaPlazoRenovacionRepositoryImpl
    extends VerificaPlazoRenovacionRepository {
  VerificaPlazoRenovacionDatasource datasource;
  VerificaPlazoRenovacionRepositoryImpl({required this.datasource});

  @override
  Future<VerificaPlazoRenovacionResponseEntity> verificaPlazoRenovacion(
    String idDpfOffice,
    String termInDays,
    String? vToken,
  ) async {
    return await datasource.verificaPlazoRenovacion(
      idDpfOffice,
      termInDays,
      vToken,
    );
  }
}
