part of 'web_person_device_authenticate_pr_key_bloc.dart';

sealed class WebPersonDeviceAuthenticatePrKeyState {}

final class WebPersonDeviceAuthenticatePrKeyInitial
    extends WebPersonDeviceAuthenticatePrKeyState {}

final class WebPersonDeviceAuthenticatePrKeyLoading
    extends WebPersonDeviceAuthenticatePrKeyState {}

final class WebPersonDeviceAuthenticatePrKeyError
    extends WebPersonDeviceAuthenticatePrKeyState {
  final String message;
  WebPersonDeviceAuthenticatePrKeyError(this.message);
}

final class WebPersonDeviceAuthenticatePrKeySuccess
    extends WebPersonDeviceAuthenticatePrKeyState {
  final String data;
  WebPersonDeviceAuthenticatePrKeySuccess(this.data);
}
