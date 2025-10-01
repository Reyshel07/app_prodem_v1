import '../entities/entity.dart';

abstract class GetParametersToDigitalDpfRepository {
  Future<GetParametersToDigitalDpfResponseentity> getParametersToDigitalDpf(
    String idFather,
    bool isEmployee,
    String? vToken,
  );
}
