import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/dpf/CreateDPFSolicitationInternal/domain/repositories/create_dpf_solicitation_internal_repository.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'create_dpf_solicitation_internal_event.dart';
part 'create_dpf_solicitation_internal_state.dart';

class CreateDpfSolicitationInternalBloc
    extends
        Bloc<
          CreateDpfSolicitationInternalEvent,
          CreateDpfSolicitationInternalState
        > {
  final CreateDpfSolicitationInternalRepository repository;
  CreateDpfSolicitationInternalBloc(this.repository)
    : super(CreateDpfSolicitationInternalInitial()) {
    on<CreateDpfSolicitInternalEvent>(createDpfSolicitInterBloc);
  }
  Future<void> createDpfSolicitInterBloc(
    CreateDpfSolicitInternalEvent event,
    Emitter<CreateDpfSolicitationInternalState> emit,
  ) async {
    emit(CreateDpfSolicitationInternalLoading());
    try {
      final token = SecureHive.readToken();
      final idPerson = SecureHive.readIdPerson();
      final idUser = SecureHive.readIdUser();
      final idWebPerson = SecureHive.readIdWebPerson();
      final location = GeolocationHelper.getLocationJson().toString();
      final response = await repository.createDpfSoliciInternal(
        token,
        event.phoneNumber,
        event.contextData,
        event.identityCardNumber,
        location,
        event.interesUpdate,
        event.amount,
        event.amountFinalUpdate,
        event.termUpdate,
        event.rateUpdate,
        event.email,
        event.names,
        event.term,
        event.idOfficeDPF,
        event.debitAccountCode,
        idPerson,
        event.ipNumber,
        event.idAccount,
        idUser,
        idWebPerson,
        event.isEmployee,
      );

      emit(CreateDpfSolicitationInternalSuccess(response.data));
    } on BaseApiException catch (error) {
      if (error.message == "api_logic_error") {
        emit(CreateDpfSolicitationInternalError(error.message));
      } else if (error.message == "dio_unexpected") {
        emit(
          CreateDpfSolicitationInternalError(
            "Ocurrió un error, no tiene internet",
          ),
        );
      } else {
        emit(CreateDpfSolicitationInternalError(error.message));
      }
    }
  }
}
