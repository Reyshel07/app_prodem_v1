part of 'check_ownership_edv_bloc.dart';

sealed class CheckOwnershipEdvEvent {}

class CheckOwnershipEdvEv extends CheckOwnershipEdvEvent {
  final String idFixedAcount;
  CheckOwnershipEdvEv({required this.idFixedAcount});
}
