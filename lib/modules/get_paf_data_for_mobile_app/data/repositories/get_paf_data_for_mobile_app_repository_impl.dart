import 'package:app_prodem_v1/modules/get_paf_data_for_mobile_app/domain/entities/get_paf_data_for_mobile_app_entity.dart';

import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GetPafDataForMobileAppRepositoryImpl
    extends GetPafDataForMobileAppRepository {
  GetPafDataForMobileAppDatasource datasource;
  GetPafDataForMobileAppRepositoryImpl({required this.datasource});

  @override
  Future<GetPafDataForMobileAppResponseEntity> getPafDataForMobileApp(
    String? vToken,
  ) async {
    return await datasource.getPafDataForMobileApp(vToken);
  }
}
