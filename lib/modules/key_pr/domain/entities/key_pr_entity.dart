class CreateProdemKeyResponseEntity {
  final int data;
  final int state;
  final String message;

  CreateProdemKeyResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}

class GetProdemKeyByIdResponseEntity {
  final String data;
  final int state;
  final String message;

  GetProdemKeyByIdResponseEntity({
    required this.data,
    required this.state,
    required this.message,
  });
}
