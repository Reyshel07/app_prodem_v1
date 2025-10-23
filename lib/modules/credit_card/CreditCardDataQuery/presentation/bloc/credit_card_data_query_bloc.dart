import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/domain/entities/credit_card_data_query_entity.dart';
import 'package:app_prodem_v1/modules/credit_card/CreditCardDataQuery/domain/repositories/credit_card_data_query_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'credit_card_data_query_event.dart';
part 'credit_card_data_query_state.dart';

class CreditCardDataQueryBloc
    extends Bloc<CreditCardDataQueryEvent, CreditCardDataQueryState> {
  final CreditCardDataQueryRepository repository;

  CreditCardDataQueryBloc(this.repository)
    : super(CreditCardDataQueryInitial()) {
    on<CreditCardDataQueryE>(creditCardDataQueryE);
  }

  Future<void> creditCardDataQueryE(
    CreditCardDataQueryE event,
    Emitter<CreditCardDataQueryState> emit,
  ) async {
    emit(CreditCardDataQueryLoading());
    try {
      final token = SecureHive.readToken();

      final idPerson = SecureHive.readIdPerson();
      final idUser = SecureHive.readIdUser();
      final imei = "";
      final location = "";
      final ipAddress = "";

      final response = await repository.creditCardDataQuery(
        token,
        event.creditCardNumber,
        idPerson,
        idUser,
        imei,
        location,
        ipAddress,
      );

      emit(CreditCardDataQuerySuccess(response.data));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(CreditCardDataQueryError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(CreditCardDataQueryError("Ocurrió un error, no tiene internet"));
      } else {
        emit(CreditCardDataQueryError(error.message));
      }
    }
  }
}
