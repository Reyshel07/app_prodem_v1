import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/get_list_departments/domain/repositories/get_list_departments_repository.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/entity.dart';

part 'get_list_departments_event.dart';
part 'get_list_departments_state.dart';

class GetListDepartmentsBloc
    extends Bloc<GetListDepartmentsEvent, GetListDepartmentsState> {
  GetListDepartmentsRepository repository;
  GetListDepartmentsBloc(this.repository) : super(GetListDepartmentsInitial()) {
    on<GetListDepaEvent>(getListDepartmentsBloc);
    on<GetListLocationDepartmentsEvent>(getListLocationDepartmentsBloc);
  }

  Future<void> getListDepartmentsBloc(
    GetListDepaEvent event,
    Emitter<GetListDepartmentsState> emit,
  ) async {
    emit(GetListDepartmentsLoading());
    try {
      final token = SecureHive.readToken();
      String idWebClient = SecureHive.readIdWebPerson();
      final response = await repository.getListDepartments(idWebClient, token);
      emit(GetListDepartmentsSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetListDepartmentsError(error.message));
        case "dio_unexpected":
          emit(GetListDepartmentsError("Ocurrio un error, no tiene internet"));
      }
    }
  }

  Future<void> getListLocationDepartmentsBloc(
    GetListLocationDepartmentsEvent event,
    Emitter<GetListDepartmentsState> emit,
  ) async {
    emit(GetListLocationDepartmentsLoading());
    try {
      final token = SecureHive.readToken();
      final response = await repository.getListLocationDepartments(
        event.idDepartment,
        token,
      );
      emit(GetListLocationDepartmentsSuccess(response));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(GetListLocationDepartmentsError(error.message));
        case "dio_unexpected":
          emit(
            GetListLocationDepartmentsError(
              "Ocurrio un error, no tiene internet",
            ),
          );
      }
    }
  }
}
