import 'package:app_prodem_v1/modules/get_external_payment_generate_file_by_web_client/domain/entities/get_external_payment_generate_file_by_web_client_entity.dart';

import '../../domain/repositories/repository.dart';
import '../datasource/datasource.dart';

class GetExternalPaymentGenerateFileWebClientRepositoryImpl
    extends GetExternalPaymentGenerateFileWebClientRepository {
  GetExternalPaymentGenerateFileWebClientDatasource datasource;
  GetExternalPaymentGenerateFileWebClientRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<GetExternalPaymentGenerateFileByWebClientResponseEntity>
  externalPaymentGeneral(
    String? vToken,
    String idWebClient,
    String initPage,
    String sizePage,
  ) async {
    return await datasource.externalPaymentGenerate(
      vToken,
      idWebClient,
      initPage,
      sizePage,
    );
  }
}
