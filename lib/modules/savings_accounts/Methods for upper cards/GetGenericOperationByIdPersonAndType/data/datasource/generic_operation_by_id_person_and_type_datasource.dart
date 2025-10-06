import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class GenericOperationByIdPersonAndTypeDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  Future<GetGenericOperationByIdPersonAndTypeResponseEntity>
  genericOperationByIdPerAndType() async {
    final response = await _dio.post(
      '$baseUrl/Mobile/GetGenericOperationByIdPersonAndType',
      data: {"IdPerson": "17000000000003984", "TypeQuery": 1},
      options: Options(
        headers: {
          'Authorization': 'Bearer  ',
          'Content-Type': 'application/json',
        },
      ),
    );
    return GetGenericOperationByIdPersonAndTypeResponseModel.fromJson(
      response.data,
    );
  }
}
