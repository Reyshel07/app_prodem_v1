import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/payment_for_services/sintesis_get_search_parameters_by_module/domain/repositories/sintesis_get_search_parameters_by_module_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

part 'sintesis_get_search_parameters_by_module_event.dart';
part 'sintesis_get_search_parameters_by_module_state.dart';

class SintesisGetSearchParametersByModuleBloc
    extends
        Bloc<
          SintesisGetSearchParametersByModuleEvent,
          SintesisGetSearchParametersByModuleState
        > {
  SintesisGetSearchParametersByModuleRepository repository;
  SintesisGetSearchParametersByModuleBloc(this.repository)
    : super(SintesisGetSearchParametersByModuleInitial()) {
    on<SintesisGetSearchParametersByMoEvent>(
      sintesisGetSearchParametersByModuleBloc,
    );
  }

  Future<void> sintesisGetSearchParametersByModuleBloc(
    SintesisGetSearchParametersByMoEvent event,
    Emitter<SintesisGetSearchParametersByModuleState> emit,
  ) async {
    emit(SintesisGetSearchParametersByModuleLoading());
    try {
      final token = SecureHive.readToken();
      final idWebClient = SecureHive.readIdWebPerson();
      String searchCriteria = "0";
      final searchParameter = [];
      String originType = "0";
      bool isMobileAPP = true;
      String idOffice = "0";
      String idCAI = "0";
      bool isFavorite = false;
      final idUser = SecureHive.readIdUser();
      String favoriteName = "";
      String externalModuleReference = "0";
      final response = await repository.sintesisGetSearchParametersByModule(
        event.externalModule,
        searchCriteria,
        searchParameter,
        originType,
        isMobileAPP,
        idUser,
        idOffice,
        idWebClient,
        idCAI,
        isFavorite,
        favoriteName,
        externalModuleReference,
        token,
      );
      emit(
        SintesisGetSearchParametersByModuleSuccess(
          response,
          event.name,
          event.description,
          event.externalModule,
        ),
      );
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(SintesisGetSearchParametersByModuleError(error.message));
        case "dio_unexpected":
          emit(
            SintesisGetSearchParametersByModuleError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
