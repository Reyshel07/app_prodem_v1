import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/list_get_other_account_deposit/domain/repositories/list_get_other_account_deposit_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

part 'list_get_other_account_deposit_event.dart';
part 'list_get_other_account_deposit_state.dart';

class ListGetOtherAccountDepositBloc
    extends
        Bloc<ListGetOtherAccountDepositEvent, ListGetOtherAccountDepositState> {
  ListGetOtherAccountDepositRepository repository;
  ListGetOtherAccountDepositBloc(this.repository)
    : super(ListGetOtherAccountDepositInitial()) {
    on<ListGetOtherAccountDeEvent>(listGetOtherAccountDepositBloc);
  }

  Future<void> listGetOtherAccountDepositBloc(
    ListGetOtherAccountDeEvent event,
    Emitter<ListGetOtherAccountDepositState> emit,
  ) async {
    emit(ListGetOtherAccountDepositLoading());
    try {
      final token = SecureHive.readToken();
      String idPerson = SecureHive.readIdPerson(); // "17000000000003984";

      final response = await repository.listGetOtherAccountDeposit(
        token,
        idPerson,
      );
      emit(ListGetOtherAccountDepositSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(ListGetOtherAccountDepositError(error.message));
        case "dio_unexpected":
          emit(
            ListGetOtherAccountDepositError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
