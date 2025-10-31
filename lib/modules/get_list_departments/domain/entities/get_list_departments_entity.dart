class GetListDepartmentsResponseEntity {
  final List<GetListDepartmentsEntity> data;
  final int state;
  final String message;

  GetListDepartmentsResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetListDepartmentsEntity {
  final int idClassifierEntity;
  final String nameClassifierEntity;
  final bool allowAmount;
  final dynamic classifierCode;

  GetListDepartmentsEntity({
    required this.idClassifierEntity,
    required this.nameClassifierEntity,
    required this.allowAmount,
    required this.classifierCode,
  });
}

///GetListLocationDepartments
class GetListLocationDepartmentsResponseEntity {
  final List<GetListLocationDepartmentsEntity> data;
  final int state;
  final String message;

  GetListLocationDepartmentsResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetListLocationDepartmentsEntity {
  final int idClassifierEntity;
  final String nameClassifierEntity;
  final bool allowAmount;
  final dynamic classifierCode;

  GetListLocationDepartmentsEntity({
    required this.idClassifierEntity,
    required this.nameClassifierEntity,
    required this.allowAmount,
    required this.classifierCode,
  });
}
