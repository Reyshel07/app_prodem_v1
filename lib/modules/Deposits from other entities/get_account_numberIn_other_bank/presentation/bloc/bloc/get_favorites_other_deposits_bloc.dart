import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/Deposits%20from%20other%20entities/get_account_numberIn_other_bank/domain/repositories/get_account_numberln_other_bank_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/entity.dart';
part 'get_favorites_other_deposits_event.dart';
part 'get_favorites_other_deposits_state.dart';

class GetFavoritesOtherDepositsBloc
    extends
        Bloc<GetFavoritesOtherDepositsEvent, GetFavoritesOtherDepositsState> {
  GetAccountNumberlnOtherBankRepository repository;
  GetFavoritesOtherDepositsBloc(this.repository)
    : super(GetFavoritesOtherDepositsInitial()) {
    on<GetFavoritesOtherDepEvent>(getFavoritesOtherDepositsBloc);
  }
  Future<void> getFavoritesOtherDepositsBloc(
    GetFavoritesOtherDepEvent event,
    Emitter<GetFavoritesOtherDepositsState> emit,
  ) async {
    emit(GetFavoritesOtherDepositsLoading());
    try {
      final token = SecureHive.readToken();
      final idUser = SecureHive.readIdUser();
      final response = await repository.getFavoritesOtherDeposits(
        token,
        idUser,
      );
      emit(GetFavoritesOtherDepositsSuccess(response));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(GetFavoritesOtherDepositsError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(
          GetFavoritesOtherDepositsError("Ocurrió un error, no tiene internet"),
        );
      } else {
        emit(GetFavoritesOtherDepositsError(error.message));
      }
    }
  }
}
