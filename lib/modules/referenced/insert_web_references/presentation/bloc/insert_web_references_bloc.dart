import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'insert_web_references_event.dart';
part 'insert_web_references_state.dart';

class InsertWebReferencesBloc
    extends Bloc<InsertWebReferencesEvent, InsertWebReferencesState> {
  InsertWebReferencesRepository repository;
  InsertWebReferencesBloc(this.repository)
    : super(InsertWebReferencesInitial()) {
    on<InsertWebRefereEvent>(insertWebReferencesBloc);
  }

  Future<void> insertWebReferencesBloc(
    InsertWebRefereEvent event,
    Emitter<InsertWebReferencesState> emit,
  ) async {
    emit(InsertWebReferencesLoading());
    try {
      final token = SecureHive.readToken();
      final idWebPersonClient = SecureHive.readIdWebPerson();
      final response = await repository.insertWebReferences(
        event.idWebReferences,
        event.fullName,
        event.identityCardNumber,
        event.cellPhoneNumber,
        event.kinship,
        event.idcProduct,
        event.productName,
        event.idMoney,
        event.shortName,
        event.ammount,
        event.processDate,
        event.isActive,
        token ?? '',
        idWebPersonClient,
      );
      emit(InsertWebReferencesSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(InsertWebReferencesError(error.message));
        case "dio_unexpected":
          emit(InsertWebReferencesError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
