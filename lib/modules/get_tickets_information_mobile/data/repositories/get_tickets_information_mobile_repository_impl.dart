import 'package:app_prodem_v1/modules/get_tickets_information_mobile/domain/entities/get_tickets_information_mobile_entity.dart';

import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GetTicketsInformationMobileRepositoryImpl
    extends GetTicketsInformationMobileRepository {
  GetTicketsInformationMobileDatasource datasource;
  GetTicketsInformationMobileRepositoryImpl({required this.datasource});

  @override
  Future<GetTicketsInformationMobileResponseEntity> getTicketsInformationMobile(
    String codeAccount,
    String? vToken,
  ) async {
    return await datasource.getTicketsInformationMobileResponseEntity(
      codeAccount,
      vToken,
    );
  }
}
