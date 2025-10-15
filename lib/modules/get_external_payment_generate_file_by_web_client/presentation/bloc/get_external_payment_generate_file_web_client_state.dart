part of 'get_external_payment_generate_file_web_client_bloc.dart';

sealed class GetExternalPaymentGenerateFileWebClientState {}

final class GetExternalPaymentGenerateFileWebClientInitial
    extends GetExternalPaymentGenerateFileWebClientState {}

final class GetExternalPaymentGenerateFileWebClientLoading
    extends GetExternalPaymentGenerateFileWebClientState {}

final class GetExternalPaymentGenerateFileWebClientError
    extends GetExternalPaymentGenerateFileWebClientState {
  final String message;
  GetExternalPaymentGenerateFileWebClientError(this.message);
}

final class GetExternalPaymentGenerateFileWebClientSuccess
    extends GetExternalPaymentGenerateFileWebClientState {
  GetExternalPaymentGenerateFileByWebClientResponseEntity
  getExternalPaymentGenerateFileByWebClientResponseEntity;
  GetExternalPaymentGenerateFileWebClientSuccess(
    this.getExternalPaymentGenerateFileByWebClientResponseEntity,
  );
}
