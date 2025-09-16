import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/repository.dart';
part 'saving_account_extrac_event.dart';
part 'saving_account_extrac_state.dart';

class SavingAccountExtracBloc
    extends Bloc<SavingAccountExtracEvent, SavingAccountExtracState> {
  SavingAccountExtracRespository savingAccountExtracRespository;
  SavingAccountExtracBloc(this.savingAccountExtracRespository)
    : super(SavingAccountExtracInitial()) {
    on<SavingAccountExEnevet>((savingAccountEx));
  }

  Future<void> savingAccountEx(
    SavingAccountExEnevet event,
    Emitter<SavingAccountExtracState> emit,
  ) async {
    emit(SavingAccountExtracLoading());
    try {
      await savingAccountExtracRespository.savingAccountExtrac(
        event.codeSavingsAccount,
      );
      emit(SavingAccountExtracSuccess('exitoso'));
    } catch (e) {
      emit(SavingAccountExtracError('error'));
    }
  }
}
