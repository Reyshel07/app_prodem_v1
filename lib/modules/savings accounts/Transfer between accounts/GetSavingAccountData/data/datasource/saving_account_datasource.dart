import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class SavingAccountDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  Future<GetSavingAccountDataResponseEntity> savingAccountData(
    String codeSavingAccountSource,
    String codeSavingAccount,
    int idMoneyOperation,
    String amountOperation,
  ) async {
    final response = await _dio.post(
      '$baseUrl/',
      data: {
        "CodeSavingAccountSource": codeSavingAccountSource, //"117-2-1-17512-5",
        "CodeSavingAccount": codeSavingAccount, //"117-2-1-17513-0",
        "IdMoneyOperation": idMoneyOperation, //1,
        "AmountOperation": amountOperation, //100,
        "IdPerson": "17000000000003984",
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer  ',
          'Content-Type': 'application/json',
        },
      ),
    );
    return GetSavingAccountDataResponseModel.fromJson(response.data);
  }
}
