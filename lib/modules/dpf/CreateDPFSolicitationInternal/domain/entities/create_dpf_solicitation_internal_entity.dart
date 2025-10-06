
class CreateDpfSolicitationInternalResponseEntity {
    final CreateDpfSolicitationInternalEntity data;
    final int state;
    final String message;

    CreateDpfSolicitationInternalResponseEntity({
        required this.data,
        required this.state,
        required this.message,
    });

}

class CreateDpfSolicitationInternalEntity {
    final double idTransaction;
    final dynamic reportToPrint;
    final dynamic reportToPrintForm;
    final int resultCode;
    final String errorMessage;
    final String reportString;

    CreateDpfSolicitationInternalEntity({
        required this.idTransaction,
        required this.reportToPrint,
        required this.reportToPrintForm,
        required this.resultCode,
        required this.errorMessage,
        required this.reportString,
    });

  
}
