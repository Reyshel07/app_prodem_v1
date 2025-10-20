part of 'pr_express_solicitation_web_bloc.dart';

sealed class PrExpressSolicitationWebState {}

final class PrExpressSolicitationWebInitial
    extends PrExpressSolicitationWebState {}

final class PrExpressSolicitationWebLoading
    extends PrExpressSolicitationWebState {}

final class PrExpressSolicitationWebError
    extends PrExpressSolicitationWebState {
  final String message;
  PrExpressSolicitationWebError(this.message);
}

final class PrExpressSolicitationWebSuccess
    extends PrExpressSolicitationWebState {
  final GetProdemExpressSolicitationWebResponseEntity
  getProdemExpressSolicitationWebResponseEntity;
  PrExpressSolicitationWebSuccess(
    this.getProdemExpressSolicitationWebResponseEntity,
  );
}

final class PrExpressSolicitationWebDeleteInitial
    extends PrExpressSolicitationWebState {}

final class PrExpressSolicitationWebDeleteLoading
    extends PrExpressSolicitationWebState {}

final class PrExpressSolicitationWebDeleteError
    extends PrExpressSolicitationWebState {
  final String message;
  PrExpressSolicitationWebDeleteError(this.message);
}

final class PrExpressSolicitationWebDeleteSuccess
    extends PrExpressSolicitationWebState {
  String prodemExpressAnnulmentResponseEntity;
  PrExpressSolicitationWebDeleteSuccess(
    this.prodemExpressAnnulmentResponseEntity,
  );
}
