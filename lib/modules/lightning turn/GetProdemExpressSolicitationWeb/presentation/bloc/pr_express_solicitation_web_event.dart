part of 'pr_express_solicitation_web_bloc.dart';

sealed class PrExpressSolicitationWebEvent {}

class PrExpressSoliWebEvent extends PrExpressSolicitationWebEvent {
  final List<String> colCodeSavingsAccounts;
  PrExpressSoliWebEvent({required this.colCodeSavingsAccounts});
}
