part of 'get_office_list_by_id_geo_bloc.dart';

sealed class GetOfficeListByIdGeoState {}

final class GetOfficeListByIdGeoInitial extends GetOfficeListByIdGeoState {}

final class GetOfficeListByIdGeoLoading extends GetOfficeListByIdGeoState {}

final class GetOfficeListByIdGeoError extends GetOfficeListByIdGeoState {
  final String message;
  GetOfficeListByIdGeoError(this.message);
}

/// Status when obtaining the list of offices by idGeo
final class GetOfficeListByIdGeoSuccess extends GetOfficeListByIdGeoState {
  final List<GetOfficeListByGeoEntiyt> offices;
  GetOfficeListByIdGeoSuccess(this.offices);
}
