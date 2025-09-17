import 'package:flutter_bloc/flutter_bloc.dart';
part 'express_data_event.dart';
part 'express_data_state.dart';

class ExpressDataBloc extends Bloc<ExpressDataEvent, ExpressDataState> {
  ExpressDataBloc() : super(ExpressDataInitial()) {
    on<ExpressDataEvent>((event, emit) {});
  }
}
