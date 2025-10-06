import 'package:dio/dio.dart';
import '../../domain/entities/entity.dart';
import '../models/model.dart';

class AllGenericOperationByIdPersonDatasource {
  final _dio = Dio();
  final String baseUrl = 'https://apidev.prodem.bo:9200';
  Future<GetAllGenericOperationByIdPersonResponseEntity>
  allGenericOprationByIdPerson() async {
    final response = await _dio.post(
      '$baseUrl/Mobile/GetAllGenericOperationByIdPerson',
      data: {'17000000000003984'},
      options: Options(
        headers: {
          'Authorization': 'Bearer  ',
          'Content-Type': 'application/json',
        },
      ),
    );
    return GetAllGenericOperationByIdPersonResponseModel.fromJson(
      response.data,
    );
  }
}
