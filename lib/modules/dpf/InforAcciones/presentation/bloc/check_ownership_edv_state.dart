part of 'check_ownership_edv_bloc.dart';

sealed class CheckOwnershipEdvState {}

final class CheckOwnershipEdvInitial extends CheckOwnershipEdvState {}

final class CheckOwnershipEdvIniLoading extends CheckOwnershipEdvState {}

final class CheckOwnershipEdvIninrror extends CheckOwnershipEdvState {
  final String message;
  CheckOwnershipEdvIninrror(this.message);
}

final class CheckOwnershipEdvSuccess extends CheckOwnershipEdvState {
  final bool data;
  CheckOwnershipEdvSuccess(this.data);
}
