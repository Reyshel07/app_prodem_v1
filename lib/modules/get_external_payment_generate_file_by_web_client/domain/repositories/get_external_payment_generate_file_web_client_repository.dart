import '../entities/entity.dart';

abstract class GetExternalPaymentGenerateFileWebClientRepository {
  Future<GetExternalPaymentGenerateFileByWebClientResponseEntity>
  externalPaymentGeneral(
    String? vToken,
    String idWebClient,
    String initPage,
    String sizePage,
  );
}
