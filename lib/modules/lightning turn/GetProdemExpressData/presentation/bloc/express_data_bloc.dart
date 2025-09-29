import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'express_data_event.dart';
part 'express_data_state.dart';

class ExpressDataBloc extends Bloc<ExpressDataEvent, ExpressDataState> {
  ProdemExpressDataRepository repository;
  ExpressDataBloc(this.repository) : super(ExpressDataInitial()) {
    on<ExpressDEvent>(expressDataBloc);
  }

  Future<void> expressDataBloc(
    ExpressDEvent event,
    Emitter<ExpressDataState> emit,
  ) async {
    emit(ExpressDataLoading());
    try {
      String idPerson = '17000000000003984';
      final token = SecureHive.readToken();
      final response = await repository.expressData(
        event.codeSavingAccountSource,
        event.amountTransaction,
        event.idMoney,
        idPerson,
        event.benificiaryDi,
        token,
      );
      emit(ExpressDataSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(ExpressDataError(error.message));
        case "dio_unexpected":
          emit(ExpressDataError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
