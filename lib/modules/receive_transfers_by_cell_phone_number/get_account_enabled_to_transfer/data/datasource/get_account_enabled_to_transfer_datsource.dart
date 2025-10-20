import 'package:app_prodem_v1/core/api/api.dart';
import 'package:app_prodem_v1/core/networking/http_services.dart';
import 'package:app_prodem_v1/modules/receive_transfers_by_cell_phone_number/get_account_enabled_to_transfer/data/models/get_account_enabled_to_transfer_model.dart';

import '../../domain/entities/entity.dart';

class GetAccountEnabledToTransferDatsource {
  final ApiClient _apiClient;
  GetAccountEnabledToTransferDatsource(this._apiClient);

  Future<GetAccountEnabledToTransferResponseEntity>
  getAccountEnableToTrans() async {
    final response = await _apiClient.post(
      ///repetido
      AppStrings.getAccountEnabledToTransfer,

      operationName: 'phone settings for your account  allied ',
      data: {"idWebPersonClient": "1129150143954615"},
    );
    return GetAccountEnabledToTransferResponse.fromJson(response);
  }
}
