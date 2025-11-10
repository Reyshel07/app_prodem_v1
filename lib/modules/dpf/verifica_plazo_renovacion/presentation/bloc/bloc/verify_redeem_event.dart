part of 'verify_redeem_bloc.dart';

sealed class VerifyRedeemEvent {}

class VerifyRedEvent extends VerifyRedeemEvent {
  final String term;
  VerifyRedEvent({required this.term});
}
