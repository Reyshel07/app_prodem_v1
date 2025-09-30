import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:app_prodem_v1/modules/home/GetAccountBalances/domain/repositories/acount_balances_repository.dart';
import 'package:app_prodem_v1/utils/device_info_helper.dart';
import 'package:app_prodem_v1/utils/geolocation_helper.dart';
import 'package:app_prodem_v1/utils/ip_helper.dart';
import 'package:app_prodem_v1/utils/secure_hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';
part 'account_balance_event.dart';
part 'account_balance_state.dart';

class AccountBalanceBloc
    extends Bloc<AccountBalanceEvent, AccountBalanceState> {
  AccountBalancesRespositoriy accountBalancesRespositoriy;
  AccountBalanceBloc(this.accountBalancesRespositoriy)
    : super(AccountBalanceInitial()) {
    on<AccountBalEvent>(accountBalance);
  }

  Future<void> accountBalance(
    AccountBalEvent event,
    Emitter<AccountBalanceState> emit,
  ) async {
    emit(AccountBalanceLoading());
    try {
      String idPerson1 =SecureHive.readIdPerson();// "17000000000003984";
      String idUser1 =SecureHive.readIdUser();// "350880";
      String location=await GeolocationHelper.getLocationJson() ;
      String  ip=await IpHelper.getDeviceIp();
      String imei=await DeviceInfoHelper.getDeviceIdentifier();
      final token = SecureHive.readToken();
      final response = await accountBalancesRespositoriy.accountBalances(
        event.codeSavingsAccount,
        idPerson1,
        idUser1,
        token,location,ip  ,imei      
      );
      emit(AccountBalanceSuccess(response.data));
    } on BaseApiException catch (error) {
      switch (error.message) {
        case "api_logic_error":
          emit(AccountBalanceError(error.message));
        case "dio_unexpected":
          emit(AccountBalanceError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
