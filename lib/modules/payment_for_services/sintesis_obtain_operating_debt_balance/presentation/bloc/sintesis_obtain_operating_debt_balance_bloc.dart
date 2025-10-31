import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'sintesis_obtain_operating_debt_balance_event.dart';
part 'sintesis_obtain_operating_debt_balance_state.dart';

class SintesisObtainOperatingDebtBalanceBloc
    extends
        Bloc<
          SintesisObtainOperatingDebtBalanceEvent,
          SintesisObtainOperatingDebtBalanceState
        > {
  SintesisObtainOperatingDebtBalanceRepository repository;
  SintesisObtainOperatingDebtBalanceBloc(this.repository)
    : super(SintesisObtainOperatingDebtBalanceInitial()) {
    on<SintesisObtainOperatingDebtBalanEvent>(
      sintesisObtainOperatingDebtBalanceBloc,
    );
  }
  Future<void> sintesisObtainOperatingDebtBalanceBloc(
    SintesisObtainOperatingDebtBalanEvent event,
    Emitter<SintesisObtainOperatingDebtBalanceState> emit,
  ) async {
    emit(SintesisObtainOperatingDebtBalanceLoading());
    try {
      final token = SecureHive.readToken();
      final idWebClient = SecureHive.readIdWebPerson();
      final idUser = SecureHive.readIdUser();
      final response = await repository.sintesisObtainOperatingDebtBalance(
        event.externalModule,
        event.searchCriteria,
        event.searchParameter,
        event.originType,
        event.isMobileAPP,
        idUser,
        event.idOffice,
        idWebClient,
        event.idCAI,
        event.isFavorite,
        event.favoriteName,
        event.externalModuleReference,
        token,
      );
      emit(SintesisObtainOperatingDebtBalanceSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(SintesisObtainOperatingDebtBalanceError(error.message));
        case "dio_unexpected":
          emit(
            SintesisObtainOperatingDebtBalanceError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
