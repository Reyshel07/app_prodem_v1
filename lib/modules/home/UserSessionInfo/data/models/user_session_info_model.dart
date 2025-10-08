import '../../domain/entities/entity.dart';
import 'dart:convert';

UserSessionInfoResponseModel userSessionInfoResponseFromJson(String str) =>
    UserSessionInfoResponseModel.fromJson(json.decode(str));

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
    required super.listFixedTermDeposit,
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
    required super.listServiceAvailable,
  });

  factory UserInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      UserInfoResponseModel(
        userId: json["userId"],
        userName: json["userName"],
        idPerson: json["idPerson"],
        idWebClient: json["idWebClient"],
        listCodeSavingsAccount: List<ListCodeCreditLineElementModel>.from(
          json["listCodeSavingsAccount"].map(
            (x) => ListCodeCreditLineElementModel.fromJson(x),
          ),
        ),
        listCodeLoanFlowCredit: List<ListCodeCreditLineElementModel>.from(
          json["listCodeLoanFlowCredit"].map(
            (x) => ListCodeCreditLineElementModel.fromJson(x),
          ),
        ),
        listCodeCreditLine: List<ListCodeCreditLineElementModel>.from(
          json["listCodeCreditLine"].map(
            (x) => ListCodeCreditLineElementModel.fromJson(x),
          ),
        ),
        listFixedTermDeposit: List<ListCodeCreditLineElementModel>.from(
          json["listFixedTermDeposit"].map(
            (x) => ListCodeCreditLineElementModel.fromJson(x),
          ),
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
        listAds: List<ListAdModel>.from(
          json["listAds"].map((x) => ListAdModel.fromJson(x)),
        ),
        listLipBank: List<ListAchBankElementModel>.from(
          json["listLIPBank"].map((x) => ListAchBankElementModel.fromJson(x)),
        ),
        listAchBank: List<ListAchBankElementModel>.from(
          json["listACHBank"].map((x) => ListAchBankElementModel.fromJson(x)),
        ),
        listDobBank: List<ListAchBankElementModel>.from(
          json["listDOBBank"].map((x) => ListAchBankElementModel.fromJson(x)),
        ),
        listOriginFund: List<ListAchBankElementModel>.from(
          json["listOriginFund"].map(
            (x) => ListAchBankElementModel.fromJson(x),
          ),
        ),
        listCommand: List<dynamic>.from(json["listCommand"].map((x) => x)),
        listServiceAvailable: List<int>.from(
          json["listServiceAvailable"].map((x) => x),
        ),
      );
}

class ListAchBankElementModel extends ListAchBankElementEntity {
  ListAchBankElementModel({
    required super.idClasificador,
    required super.nombre,
    required super.codigo,
  });

  factory ListAchBankElementModel.fromJson(Map<String, dynamic> json) =>
      ListAchBankElementModel(
        idClasificador: json["idClasificador"],
        nombre: json["nombre"],
        codigo: json["codigo"],
      );

  Map<String, dynamic> toJson() => {
    "idClasificador": idClasificador,
    "nombre": nombre,
    "codigo": codigo,
  };
}

class ListAdModel extends ListAdEntity {
  ListAdModel({
    required super.imageUrl,
    required super.typeToLink,
    required super.linkToGo,
    required super.withAnimation,
    required super.orderSequence,
  });

  factory ListAdModel.fromJson(Map<String, dynamic> json) => ListAdModel(
    imageUrl: json["imageUrl"],
    typeToLink: json["typeToLink"],
    linkToGo: json["linkToGo"],
    withAnimation: json["withAnimation"],
    orderSequence: json["orderSequence"],
  );
}

class ListCodeCreditLineElementModel extends ListCodeCreditLineElementEntity {
  ListCodeCreditLineElementModel({
    required super.idMoney,
    required super.codMoney,
    required super.idOperationEntity,
    required super.operationCode,
    required super.availableAmount,
    required super.idOffice,
    required super.specialBehavior,
    required super.stateOperation,
    required super.balance,
  });

  factory ListCodeCreditLineElementModel.fromJson(Map<String, dynamic> json) =>
      ListCodeCreditLineElementModel(
        idMoney: json["idMoney"],
        codMoney: json["codMoney"],
        idOperationEntity: json["idOperationEntity"].toString(),
        operationCode: json["operationCode"],
        availableAmount: json["availableAmount"].toDouble(),
        idOffice: json["idOffice"],
        specialBehavior: json["specialBehavior"],
        stateOperation: json["stateOperation"],
        balance: json["balance"],
      );
}
