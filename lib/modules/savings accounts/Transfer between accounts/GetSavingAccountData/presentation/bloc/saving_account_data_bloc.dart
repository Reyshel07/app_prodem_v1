import 'package:flutter_bloc/flutter_bloc.dart';

part 'saving_account_data_event.dart';
part 'saving_account_data_state.dart';

class SavingAccountDataBloc
    extends Bloc<SavingAccountDataEvent, SavingAccountDataState> {
  SavingAccountDataBloc() : super(SavingAccountDataInitial()) {
    on<SavingAccountDataEvent>((event, emit) {});
  }
}
