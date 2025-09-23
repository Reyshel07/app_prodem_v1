import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saving_account_transfer_mobile_event.dart';
part 'saving_account_transfer_mobile_state.dart';

class SavingAccountTransferMobileBloc extends Bloc<SavingAccountTransferMobileEvent, SavingAccountTransferMobileState> {
  SavingAccountTransferMobileBloc() : super(SavingAccountTransferMobileInitial()) {
    on<SavingAccountTransferMobileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
