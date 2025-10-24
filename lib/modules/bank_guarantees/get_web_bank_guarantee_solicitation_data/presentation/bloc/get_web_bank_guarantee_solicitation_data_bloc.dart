import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'get_web_bank_guarantee_solicitation_data_event.dart';
part 'get_web_bank_guarantee_solicitation_data_state.dart';

class GetWebBankGuaranteeSolicitationDataBloc
    extends
        Bloc<
          GetWebBankGuaranteeSolicitationDataEvent,
          GetWebBankGuaranteeSolicitationDataState
        > {
  GetWebBankGuaranteeSolicitationDataRepository repository;
  GetWebBankGuaranteeSolicitationDataBloc(this.repository)
    : super(GetWebBankGuaranteeSolicitationDataInitial()) {
    on<GetWebBamkGuaranteeSoliEvent>(getWebBankGuaranteeSolicitationDataBloc);
  }

  Future<void> getWebBankGuaranteeSolicitationDataBloc(
    GetWebBamkGuaranteeSoliEvent event,
    Emitter<GetWebBankGuaranteeSolicitationDataState> emit,
  ) async {
    emit(GetWebBankGuaranteeSolicitationDataLoading());
    try {
      String idWebPersonClient = SecureHive.readIdWebPerson();
      final token = SecureHive.readToken();
      final response = await repository.getWebBankGuaranteeSolicitationData(
        idWebPersonClient,
        token,
      );
      emit(GetWebBankGuaranteeSolicitationDataSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(GetWebBankGuaranteeSolicitationDataError(error.message));
        case "dio_unexpected":
          emit(
            GetWebBankGuaranteeSolicitationDataError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
