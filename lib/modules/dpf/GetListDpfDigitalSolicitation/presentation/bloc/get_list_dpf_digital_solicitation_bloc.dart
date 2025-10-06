import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/dpf/GetListDpfDigitalSolicitation/domain/repositories/get_list_dpf_digital_solicitation_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
part 'get_list_dpf_digital_solicitation_event.dart';
part 'get_list_dpf_digital_solicitation_state.dart';

class GetListDpfDigitalSolicitationBloc
    extends
        Bloc<
          GetListDpfDigitalSolicitationEvent,
          GetListDpfDigitalSolicitationState
        > {
  GetListDpfDigitalSolicitationRepository repository;
  GetListDpfDigitalSolicitationBloc(this.repository)
    : super(GetListDpfDigitalSolicitationInitial()) {
    on<GEtListDpfDigitSoliEvent>(getListDpfDigitalSoli);
  }

  Future<void> getListDpfDigitalSoli(
    GEtListDpfDigitSoliEvent event,
    Emitter<GetListDpfDigitalSolicitationState> emit,
  ) async {
    emit(GetListDpfDigitalSolicitationLoading());
    try {
      final token = SecureHive.readToken();
      final idWebClient = SecureHive.readIdWebPerson();
      final response = await repository.getListDpfDigitalSoliR(
        idWebClient,
        token,
      );
      emit(GetListDpfDigitalSolicitationSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetListDpfDigitalSolicitationError(error.message));
        case "dio_unexpected":
          emit(
            GetListDpfDigitalSolicitationError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
