part of 'saving_account_extrac_bloc.dart';

enum SavingAccountExtracStatus { initial, loading, success, error }

class SavingAccountExtracState {
  final DataSavingAccountExtracEntity? dataSavingAccountExtrac;
  final SavingAccountExtracStatus status;
  const SavingAccountExtracState({
    this.dataSavingAccountExtrac,
    this.status = SavingAccountExtracStatus.initial,
  });
  factory SavingAccountExtracState.initialState() =>
      const SavingAccountExtracState();
  SavingAccountExtracState copyWith({
    DataSavingAccountExtracEntity? dataSavingAccountExtrac,
    SavingAccountExtracStatus? status,
  }) {
    return SavingAccountExtracState(
      dataSavingAccountExtrac:
          dataSavingAccountExtrac ?? this.dataSavingAccountExtrac,
      status: status ?? this.status,
    );
  }
}

extension AccountBalancesStateX on SavingAccountExtracState {
  bool get isLoading => status == SavingAccountExtracStatus.loading;
  bool get isSuccess => status == SavingAccountExtracStatus.success;
  bool get isError => status == SavingAccountExtracStatus.error;
  bool get hasData => dataSavingAccountExtrac != null;
}
