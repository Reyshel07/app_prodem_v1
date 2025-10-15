part of 'get_external_payment_generate_file_web_client_bloc.dart';

sealed class GetExternalPaymentGenerateFileWebClientEvent {}

class GetExternalPaymentGenerateFileWebCliEvent
    extends GetExternalPaymentGenerateFileWebClientEvent {
  String initPage;
  GetExternalPaymentGenerateFileWebCliEvent({required this.initPage});
}
