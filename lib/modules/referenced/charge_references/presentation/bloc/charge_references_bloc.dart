import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'charge_references_event.dart';
part 'charge_references_state.dart';

class ChargeReferencesBloc
    extends Bloc<ChargeReferencesEvent, ChargeReferencesState> {
  ChargeReferencesRepository repository;
  ChargeReferencesBloc(this.repository) : super(ChargeReferencesInitial()) {
    on<ChargeRefEvent>(chargeReferencesBloc);
  }
  Future<void> chargeReferencesBloc(
    ChargeRefEvent event,
    Emitter<ChargeReferencesState> emit,
  ) async {
    emit(ChargeReferencesLoading());
    try {
      final token = SecureHive.readToken();
      final idWebPersonClient = SecureHive.readIdWebPerson();
      final response = await repository.chargeReferences(
        idWebPersonClient,
        token ?? '',
      );

      emit(ChargeReferencesSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(ChargeReferencesError(error.message));
        case "dio_unexpected":
          emit(ChargeReferencesError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
