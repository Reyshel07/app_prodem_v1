part of 'get_bank_guarantee_class_bloc.dart';

sealed class GetBankGuaranteeClassState {}

final class GetBankGuaranteeClassInitial extends GetBankGuaranteeClassState {}

final class GetBankGuaranteeClassLoading extends GetBankGuaranteeClassState {}

final class GetBankGuaranteeClassError extends GetBankGuaranteeClassState {
  final String message;
  GetBankGuaranteeClassError(this.message);
}

final class GetBankGuaranteeClassSuccess extends GetBankGuaranteeClassState {
  final GetBankGuaranteeClassResponseEntity getBankGuaranteeClassResponseEntity;
  GetBankGuaranteeClassSuccess(this.getBankGuaranteeClassResponseEntity);
}
