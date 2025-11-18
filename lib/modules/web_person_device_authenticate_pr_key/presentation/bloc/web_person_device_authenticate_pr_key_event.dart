part of 'web_person_device_authenticate_pr_key_bloc.dart';

sealed class WebPersonDeviceAuthenticatePrKeyEvent {}

class WebPersonDeviceAuthenPrKeyEvent
    extends WebPersonDeviceAuthenticatePrKeyEvent {
  final String customerPIN;
  final bool verifyPIN;
  WebPersonDeviceAuthenPrKeyEvent({
    required this.customerPIN,
    required this.verifyPIN,
  });
}
