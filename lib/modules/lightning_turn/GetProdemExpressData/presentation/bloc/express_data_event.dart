part of 'express_data_bloc.dart';

sealed class ExpressDataEvent {}

final class ExpressDEvent extends ExpressDataEvent {
  final String codeSavingAccountSource;
  final String amountTransaction;
  final String idMoney;
  final String benificiaryDi;

  ExpressDEvent({
    required this.amountTransaction,
    required this.benificiaryDi,
    required this.codeSavingAccountSource,
    required this.idMoney,
  });
}
