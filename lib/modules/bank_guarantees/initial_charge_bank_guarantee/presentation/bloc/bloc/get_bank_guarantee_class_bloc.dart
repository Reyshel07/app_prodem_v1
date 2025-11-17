import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/bank_guarantees/initial_charge_bank_guarantee/domain/repositories/initial_charge_bank_guarante_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entity.dart';

part 'get_bank_guarantee_class_event.dart';
part 'get_bank_guarantee_class_state.dart';

class GetBankGuaranteeClassBloc
    extends Bloc<GetBankGuaranteeClassEvent, GetBankGuaranteeClassState> {
  InitialChargeBankGuaranteRepository repository;
  GetBankGuaranteeClassBloc(this.repository)
    : super(GetBankGuaranteeClassInitial()) {
    on<GetBankGuarClassEvent>(getBankGuaranteeClassBloc);
  }
  Future<void> getBankGuaranteeClassBloc(
    GetBankGuarClassEvent event,
    Emitter<GetBankGuaranteeClassState> emit,
  ) async {
    emit(GetBankGuaranteeClassLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getBankGuaranteeClass(
        token,
        event.isPublic,
      );
      emit(GetBankGuaranteeClassSuccess(response));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(GetBankGuaranteeClassError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(GetBankGuaranteeClassError("Ocurrió un error, no tiene internet"));
      } else {
        emit(GetBankGuaranteeClassError(error.message));
      }
    }
  }
}
