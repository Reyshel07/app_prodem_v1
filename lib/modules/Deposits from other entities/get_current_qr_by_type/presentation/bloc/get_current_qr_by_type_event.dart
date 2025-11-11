part of 'get_current_qr_by_type_bloc.dart';

sealed class GetCurrentQrByTypeEvent {}

class GetCurrentQrEvent extends GetCurrentQrByTypeEvent {
  GetCurrentQrEvent();
}
