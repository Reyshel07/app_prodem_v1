part of 'verify_redeem_bloc.dart';

sealed class VerifyRedeemState {}

final class VerifyRedeemInitial extends VerifyRedeemState {}

final class VerifyRedeemLoading extends VerifyRedeemState {}

final class VerifyRedeemError extends VerifyRedeemState {
  final String message;
  VerifyRedeemError(this.message);
}

final class VerifyRedeemSuccess extends VerifyRedeemState {
  final VerifyRedeemResponseEntity data;

  VerifyRedeemSuccess(this.data);
}
