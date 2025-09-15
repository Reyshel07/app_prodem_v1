import '../../domain/entities/entity.dart';

class UserSessionInfoResponseModel extends UserSessionInfoResponseEntity {
  UserSessionInfoResponseModel({
    required super.data,
    required super.state,
    required super.message,
  });

  factory UserSessionInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      UserSessionInfoResponseModel(
        data: UserInfoResponseModel.fromJson(json["data"]),
        state: json["state"],
        message: json["message"],
      );
}

class UserInfoResponseModel extends UserInfoResponseEnttity {
  UserInfoResponseModel({
    required super.userId,
    required super.userName,
    required super.idPerson,
    required super.idWebClient,
    required super.listCodeSavingsAccount,
    required super.listCodeLoanFlowCredit,
    required super.listCodeCreditLine,
    required super.listElectronicWallet,
    required super.currencyExchangeBuy,
    required super.currencyExchangeSell,
    required super.isEmployee,
    required super.processDate,
    required super.personName,
    required super.idcQuestion,
    required super.cellPhoneNumber,
    required super.maximumAmount,
    required super.maximumElectronicWalletAmount,
    required super.email,
    required super.sendEmailNotification,
    required super.identityCardNumber,
    required super.estado,
    required super.isPersonNatural,
    required super.isCallCenter,
    required super.isEtv,
    required super.hasContractPending,
    required super.contractMessage,
    required super.listAds,
    required super.listLipBank,
    required super.listAchBank,
    required super.listDobBank,
    required super.listOriginFund,
    required super.listCommand,
  });

  factory UserInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      UserInfoResponseModel(
        userId: json["userId"],
        userName: json["userName"],
        idPerson: json["idPerson"],
        idWebClient: json["idWebClient"],
        listCodeSavingsAccount: List<ListCodeModel>.from(
          json["listCodeSavingsAccount"].map((x) => ListCodeModel.fromJson(x)),
        ),
        listCodeLoanFlowCredit: List<ListCodeModel>.from(
          json["listCodeLoanFlowCredit"].map((x) => ListCodeModel.fromJson(x)),
        ),
        listCodeCreditLine: List<ListCodeModel>.from(
          json["listCodeCreditLine"].map((x) => ListCodeModel.fromJson(x)),
        ),
        listElectronicWallet: List<dynamic>.from(
          json["listElectronicWallet"].map((x) => x),
        ),
        currencyExchangeBuy: json["currencyExchangeBuy"],
        currencyExchangeSell: json["currencyExchangeSell"],
        isEmployee: json["isEmployee"],
        processDate: DateTime.parse(json["processDate"]),
        personName: json["personName"],
        idcQuestion: json["idcQuestion"],
        cellPhoneNumber: json["cellPhoneNumber"],
        maximumAmount: json["maximumAmount"],
        maximumElectronicWalletAmount: json["maximumElectronicWalletAmount"],
        email: json["email"],
        sendEmailNotification: json["sendEmailNotification"],
        identityCardNumber: json["identityCardNumber"],
        estado: json["estado"],
        isPersonNatural: json["isPersonNatural"],
        isCallCenter: json["isCallCenter"],
        isEtv: json["isETV"],
        hasContractPending: json["hasContractPending"],
        contractMessage: json["contractMessage"],
        listAds: List<ListAdResponseModel>.from(
          json["listAds"].map((x) => ListAdResponseModel.fromJson(x)),
        ),
        listLipBank: List<dynamic>.from(json["listLIPBank"].map((x) => x)),
        listAchBank: List<dynamic>.from(json["listACHBank"].map((x) => x)),
        listDobBank: List<dynamic>.from(json["listDOBBank"].map((x) => x)),
        listOriginFund: List<dynamic>.from(
          json["listOriginFund"].map((x) => x),
        ),
        listCommand: List<dynamic>.from(json["listCommand"].map((x) => x)),
      );
}

class ListAdResponseModel extends ListAdResponseEntity {
  ListAdResponseModel({
    required super.imageUrl,
    required super.typeToLink,
    required super.linkToGo,
    required super.withAnimation,
    required super.orderSequence,
  });

  factory ListAdResponseModel.fromJson(Map<String, dynamic> json) =>
      ListAdResponseModel(
        imageUrl: json["imageUrl"],
        typeToLink: json["typeToLink"],
        linkToGo: json["linkToGo"],
        withAnimation: json["withAnimation"],
        orderSequence: json["orderSequence"],
      );
}

class ListCodeModel extends ListCodeResponseEntity {
  ListCodeModel({
    required super.idMoney,
    required super.codMoney,
    required super.idOperationEntity,
    required super.operationCode,
    required super.availableAmount,
    required super.idOffice,
    required super.specialBehavior,
  });

  factory ListCodeModel.fromJson(Map<String, dynamic> json) => ListCodeModel(
    idMoney: json["idMoney"],
    codMoney: json["codMoney"],
    idOperationEntity: json["idOperationEntity"]?.toDouble(),
    operationCode: json["operationCode"],
    availableAmount: json["availableAmount"]?.toDouble(),
    idOffice: json["idOffice"],
    specialBehavior: json["specialBehavior"],
  );
}
