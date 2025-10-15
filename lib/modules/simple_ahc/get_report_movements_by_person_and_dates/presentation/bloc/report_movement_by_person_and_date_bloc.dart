import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/simple_ahc/get_report_movements_by_person_and_dates/domain/repositories/report_movements_by_person_and_dates_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'report_movement_by_person_and_date_event.dart';
part 'report_movement_by_person_and_date_state.dart';

class ReportMovementByPersonAndDateBloc
    extends
        Bloc<
          ReportMovementByPersonAndDateEvent,
          ReportMovementByPersonAndDateState
        > {
  ReportMovementsByPersonAndDatesRepository repository;
  ReportMovementByPersonAndDateBloc(this.repository)
    : super(ReportMovementByPersonAndDateInitial()) {
    on<ReportMovementByPersonAndDatEvent>(reportMovementByPersonAndDate);
  }

  Future<void> reportMovementByPersonAndDate(
    ReportMovementByPersonAndDatEvent event,
    Emitter<ReportMovementByPersonAndDateState> emit,
  ) async {
    emit(ReportMovementByPersonAndDateLoading());
    try {
      final token = SecureHive.readToken();
      String idPerson = SecureHive.readIdPerson();
      final response = await repository.reportMovementByPErsonAndDate(
        token,
        event.movementType,
        idPerson,
        event.dateIni,
        event.dateFin,
      );
      emit(ReportMovementByPersonAndDateSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(ReportMovementByPersonAndDateError(error.message));
        case "dio_unexpected":
          emit(
            ReportMovementByPersonAndDateError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
