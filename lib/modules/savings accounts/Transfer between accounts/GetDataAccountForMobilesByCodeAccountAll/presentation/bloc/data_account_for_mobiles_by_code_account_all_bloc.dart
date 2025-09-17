import 'package:flutter_bloc/flutter_bloc.dart';
part 'data_account_for_mobiles_by_code_account_all_event.dart';
part 'data_account_for_mobiles_by_code_account_all_state.dart';

class DataAccountForMobilesByCodeAccountAllBloc
    extends
        Bloc<
          DataAccountForMobilesByCodeAccountAllEvent,
          DataAccountForMobilesByCodeAccountAllState
        > {
  DataAccountForMobilesByCodeAccountAllBloc()
    : super(DataAccountForMobilesByCodeAccountAllInitial()) {
    on<DataAccountForMobilesByCodeAccountAllEvent>((event, emit) {});
  }
}
