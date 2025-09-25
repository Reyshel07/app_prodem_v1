import 'package:flutter_bloc/flutter_bloc.dart';

part 'transfer_ach_from_mobile_banking_event.dart';
part 'transfer_ach_from_mobile_banking_state.dart';

class TransferAchFromMobileBankingBloc
    extends
        Bloc<
          TransferAchFromMobileBankingEvent,
          TransferAchFromMobileBankingState
        > {
  TransferAchFromMobileBankingBloc()
    : super(TransferAchFromMobileBankingInitial()) {
    on<TransferAchFromMobileBankingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
