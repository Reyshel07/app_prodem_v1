import 'package:app_prodem_v1/modules/get_current_qr_by_type/data/datasource/get_current_qr_by_type_datasource.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/domain/entities/get_current_qr_by_type_entity.dart';
import 'package:app_prodem_v1/modules/get_current_qr_by_type/domain/repositories/get_current_qr_by_type_repository.dart';

class GetCurrentQrByTypeRepositoryImpl extends GetCurrentQrByTypeRepository {
  GetCurrentQrByTypeDatasource datasource;
  GetCurrentQrByTypeRepositoryImpl({required this.datasource});

  @override
  Future<GetCurrentQrByTypeResponseEntity> currentQrByType(
    String? vToken,
  ) async {
    return await datasource.currentQrByType(vToken);
  }
}
