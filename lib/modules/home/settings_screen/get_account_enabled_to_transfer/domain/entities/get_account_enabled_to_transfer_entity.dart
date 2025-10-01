class GetAccountEnabledToTransferResponseEntity {
  final String data;
  final int state;
  final String message;

  GetAccountEnabledToTransferResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class AccountEnabledToTransferSaveResponseEntity {
  final bool data;
  final int state;
  final String message;

  AccountEnabledToTransferSaveResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}
