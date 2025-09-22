part of 'saving_account_extrac_bloc.dart';

sealed class SavingAccountExtracState {}

final class SavingAccountExtracInitial extends SavingAccountExtracState {}

final class SavingAccountExtracLoading extends SavingAccountExtracState {}

final class SavingAccountExtracError extends SavingAccountExtracState {
  final String message;
  SavingAccountExtracError(this.message);
}

final class SavingAccountExtracSuccess extends SavingAccountExtracState {
  DataSavingAccountExtracEntity dataSavingAccountExtracEntity;
  SavingAccountExtracSuccess(this.dataSavingAccountExtracEntity);
}
