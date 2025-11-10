part of 'check_ownership_edv_bloc.dart';

sealed class CheckOwnershipEdvEvent {}

class CheckOwnershipEdvEv extends CheckOwnershipEdvEvent {
  final String idFixedAcount;
  final DpfExpiracionEntity? data;
  CheckOwnershipEdvEv({required this.idFixedAcount, required this.data});
}
