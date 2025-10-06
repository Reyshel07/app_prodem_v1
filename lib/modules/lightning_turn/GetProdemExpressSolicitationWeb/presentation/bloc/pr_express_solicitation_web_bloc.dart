import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/lightning_turn/GetProdemExpressSolicitationWeb/domain/repositories/pr_express_solicitation_web_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

part 'pr_express_solicitation_web_event.dart';
part 'pr_express_solicitation_web_state.dart';

class PrExpressSolicitationWebBloc
    extends Bloc<PrExpressSolicitationWebEvent, PrExpressSolicitationWebState> {
  PrExpressSolicitationWebRepository repository;
  PrExpressSolicitationWebBloc(this.repository)
    : super(PrExpressSolicitationWebInitial()) {
    on<PrExpressSoliWebEvent>(_prExpressSoliWebBloc);
    on<PrDeleteEvent>(_prDeleteBloc);
  }

  Future<void> _prExpressSoliWebBloc(
    PrExpressSoliWebEvent event,
    Emitter<PrExpressSolicitationWebState> emit,
  ) async {
    emit(PrExpressSolicitationWebLoading());
    try {
      String idPerson = SecureHive.readIdPerson(); // '17000000000003984';
      final token = SecureHive.readToken();
      final response = await repository.prExpressSoliWeb(
        idPerson,
        token,
        event.colCodeSavingsAccounts,
      );
      emit(PrExpressSolicitationWebSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(PrExpressSolicitationWebError(error.message));
        case "dio_unexpected":
          emit(
            PrExpressSolicitationWebError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }

  Future<void> _prDeleteBloc(
    PrDeleteEvent event,
    Emitter<PrExpressSolicitationWebState> emit,
  ) async {
    emit(PrExpressSolicitationWebLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.prDelete(event.id, token);
      emit(PrDeleteSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(PrExpressSolicitationWebError(error.message));
        case "dio_unexpected":
          emit(
            PrExpressSolicitationWebError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
