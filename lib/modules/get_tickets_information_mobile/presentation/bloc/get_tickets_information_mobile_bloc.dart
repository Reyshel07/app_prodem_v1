import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'get_tickets_information_mobile_event.dart';
part 'get_tickets_information_mobile_state.dart';

class GetTicketsInformationMobileBloc
    extends
        Bloc<
          GetTicketsInformationMobileEvent,
          GetTicketsInformationMobileState
        > {
  GetTicketsInformationMobileRepository repository;
  GetTicketsInformationMobileBloc(this.repository)
    : super(GetTicketsInformationMobileInitial()) {
    on<GetTicketsInformationMobiEvent>(getTicketsInformationMobileBloc);
  }

  Future<void> getTicketsInformationMobileBloc(
    GetTicketsInformationMobiEvent event,
    Emitter<GetTicketsInformationMobileState> emit,
  ) async {
    emit(GetTicketsInformationMobileLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getTicketsInformationMobile(
        event.codeAccount,
        token,
      );
      emit(GetTicketsInformationMobileSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(GetTicketsInformationMobileError(error.message));
        case "dio_unexpected":
          emit(
            GetTicketsInformationMobileError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
