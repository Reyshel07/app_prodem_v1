import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class DataAccountForMobilesByCodeAccountAllDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  Future<GetDataAccountForMobilesByCodeAccountAllResponseEntity>
  dataAccountForMobileByCodeAccountAll() async {
    final response = await _dio.post(
      '$baseUrl/',
      data: {"117-2-1-11089-5"}, //codeAccount
      options: Options(
        headers: {
          'Authorization': 'Bearer  ',
          'Content-Type': 'application/json',
        },
      ),
    );
    return GetDataAccountForMobilesByCodeAccountAllResponseModel.fromJson(
      response.data,
    );
  }
}
