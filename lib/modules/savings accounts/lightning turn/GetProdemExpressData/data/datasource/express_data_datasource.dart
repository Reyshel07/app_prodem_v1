import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class ExpressDataDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  Future<GetProdemExpressDataResponseEntity> expressData(
    String codeSavingAccountSource,
    String amountTransaction,
    String idMoney,
    String idPErson,
    String benificiaryDi,
  ) async {
    final response = await _dio.post(
      '$baseUrl/Mobile/GetProdemExpressData',
      data: {
        "CodeSavingAccountSource": codeSavingAccountSource, //"117-2-1-17512-2",
        "AmountTransaction": amountTransaction, //"100",
        "IdMoney": idMoney, //"1",
        "IdPerson": idPErson, //"0",
        "BeneficiaryDI": benificiaryDi, //"145454",
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer  ',
          'Content-Type': 'application/json',
        },
      ),
    );
    return GetProdemExpressDataResponseModel.fromJson(response.data);
  }
}
