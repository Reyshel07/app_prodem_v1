import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class SavingAccountExtracDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  Future<SavingsAccountExtractDataTransactionableResponseEntity>
  savingAccountExtrac(
    String codeSavingsAccount,
    String idPerson,
    String idUser,
    String? vToken,
  ) async {
    final response = await _dio.post(
      '$baseUrl/Mobile/SavingsAccountExtractDataTransactionable',
      data: {
        "CodeSavingsAccount": codeSavingsAccount,
        "IdPerson": idPerson,
        "IdUser": idUser,
        "IMEI": "c0556d3b362470ac",
        "location": "",
        "IpAddress": "192.168.162.12",
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $vToken',
          'Content-Type': 'application/json',
        },
      ),
    );
    return SavingsAccountExtractDataTransactionableResponse.fromJson(
      response.data,
    );
  }
}
//cajas de ahorro- uñtimos movimientos 