import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/domain/entities/initial_charge_bank_guarante_entity.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/initial_charge_bank_guarante_repository.dart';

part 'initial_charge_bank_guarantee_event.dart';
part 'initial_charge_bank_guarantee_state.dart';

class InitialChargeBankGuaranteeBloc
    extends
        Bloc<InitialChargeBankGuaranteeEvent, InitialChargeBankGuaranteeState> {
  InitialChargeBankGuaranteRepository repository;
  InitialChargeBankGuaranteeBloc(this.repository)
    : super(InitialChargeBankGuaranteeInitial()) {
    on<InitialChargeBankGuarEvent>(initialChargeBankGuaranteeBloc);
  }

  Future<void> initialChargeBankGuaranteeBloc(
    InitialChargeBankGuarEvent event,
    Emitter<InitialChargeBankGuaranteeState> emit,
  ) async {
    emit(InitialChargeBankGuaranteeLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.initialChargeBankGuarantee(token);
      emit(InitialChargeBankGuaranteeSuccess(response));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(InitialChargeBankGuaranteeError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(
          InitialChargeBankGuaranteeError(
            "Ocurrió un error, no tiene internet",
          ),
        );
      } else {
        emit(InitialChargeBankGuaranteeError(error.message));
      }
    }
  }

  Future<void> getMoneyByAccountBloc(
    GetMoneyByAccountEvent event,
    Emitter<InitialChargeBankGuaranteeState> emit,
  ) async {
    emit(GetMoneyByAccountLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getMoneyByAccount(
        event.codeAccount,
        token,
      );
      emit(GetMoneyByAccountSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetMoneyByAccountError(error.message));
        case "dio_unexpected":
          emit(GetMoneyByAccountError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
