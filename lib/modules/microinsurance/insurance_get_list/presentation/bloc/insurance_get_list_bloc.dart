import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'insurance_get_list_event.dart';
part 'insurance_get_list_state.dart';

class InsuranceGetListBloc
    extends Bloc<InsuranceGetListEvent, InsuranceGetListState> {
  InsuranceGetListRepository repository;
  InsuranceGetListBloc(this.repository) : super(InsuranceGetListInitial()) {
    on<InsurGetListEvent>(insuranceGetListBloc);
  }

  Future<void> insuranceGetListBloc(
    InsurGetListEvent event,
    Emitter<InsuranceGetListState> emit,
  ) async {
    emit(InsuranceGetListLoading());
    try {
      String idPerson1 = SecureHive.readIdPerson();
      final token = SecureHive.readToken();
      final response = await repository.insuranceGetList(
        event.identityCardNumber,
        idPerson1,
        token,
      );
      emit(InsuranceGetListSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(InsuranceGetListError(error.message));
        case "dio_unexpected":
          emit(InsuranceGetListError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
