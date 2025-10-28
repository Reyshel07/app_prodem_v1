class SintesisGetSearchParametersByModuleResponseEntity {
  final List<SintesisGetSearchParametersByModuleEntity> data;
  final int state;
  final String message;

  SintesisGetSearchParametersByModuleResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class SintesisGetSearchParametersByModuleEntity {
  final int codeModule;
  final String moduleName;
  final List<ColFieldEntity> colFields;

  SintesisGetSearchParametersByModuleEntity({
    required this.codeModule,
    required this.moduleName,
    required this.colFields,
  });
}

class ColFieldEntity {
  final String parameterName;
  final String parameterType;
  final List<ColComboDatumEntity> colComboData;

  ColFieldEntity({
    required this.parameterName,
    required this.parameterType,
    required this.colComboData,
  });
}

class ColComboDatumEntity {
  final int idDataParam;
  final String dataParamCode;
  final String paramDescription;

  ColComboDatumEntity({
    required this.idDataParam,
    required this.dataParamCode,
    required this.paramDescription,
  });
}
