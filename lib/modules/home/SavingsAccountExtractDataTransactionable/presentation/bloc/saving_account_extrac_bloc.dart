import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
import '../../domain/repositories/repository.dart';
part 'saving_account_extrac_event.dart';
part 'saving_account_extrac_state.dart';

class SavingAccountExtracBloc
    extends Bloc<SavingAccountExtracEvent, SavingAccountExtracState> {
  SavingAccountExtracRespository savingAccountExtracRespository;
  SavingAccountExtracBloc(this.savingAccountExtracRespository)
    : super(SavingAccountExtracState()) {
    on<SavingAccountExEnevet>((savingAccountEx));
  }

  Future<void> savingAccountEx(
    SavingAccountExEnevet event,
    Emitter<SavingAccountExtracState> emit,
  ) async {
    emit(state.copyWith(status: SavingAccountExtracStatus.loading));
    try {
      final token = SecureHive.readToken();
      String idPerson = '';
      String idUser = '';
      await savingAccountExtracRespository.savingAccountExtrac(
        event.codeSavingsAccount,
        idPerson,
        idUser,
        token,
      );
      emit(state.copyWith(status: SavingAccountExtracStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SavingAccountExtracStatus.error));
    }
  }
}
