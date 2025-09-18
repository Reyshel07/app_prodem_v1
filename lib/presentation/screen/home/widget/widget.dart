import 'package:app_prodem_v1/config/theme/extension_theme.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:app_prodem_v1/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../modules/home/UserSessionInfo/domain/entities/entity.dart';
import '../../../../modules/home/UserSessionInfo/presentation/bloc/bloc.dart';

class ImgVerde extends StatelessWidget {
  const ImgVerde({
    super.key,
    required this.screenSize,
    required this.topPadding,
    required this.letterSize,
    required this.smallSpacing,
  });

  final Size screenSize;
  final double topPadding;
  final double letterSize;
  final double smallSpacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.18,
      width: screenSize.width * 0.95,
      child:
          BlocSelector<
            SessionInfoBloc,
            SessionInfoState,
            UserSessionInfoResponseEntity?
          >(
            selector: (state) {
              if (state is SessionInfoSuccess) return state.response;
              return null;
            },
            builder: (context, state) {
              final list =
                  state?.data.listCodeSavingsAccount ??
                  <ListCodeResponseEntity>[];
              final int count = list.length;
              final double? firstAmount = count > 0
                  ? list[0].availableAmount
                  : null;
              final String? firstOperation = count > 0
                  ? list[0].operationCode
                  : null;
              final String? firstCodMoney = count > 0 ? list[0].codMoney : null;

              final listLoanCredit =
                  state?.data.listCodeLoanFlowCredit ??
                  <ListCodeResponseEntity>[];
              final int count1 = listLoanCredit.length;
              final double? firstAmount1 = count > 0
                  ? listLoanCredit[0].availableAmount
                  : null;
              final String? firstOperation1 = count > 0
                  ? listLoanCredit[0].operationCode
                  : null;
              final String? firstCodMoney1 = count > 0
                  ? listLoanCredit[0].codMoney
                  : null;

              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Expanded(
                    child: ListCodeSavingsAccount(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      topPadding: topPadding,
                      itenCount: count,
                      textAmount: firstAmount,
                      codeOperation: firstOperation,
                      codMoney: firstCodMoney,
                      img: Image.asset(
                        AssetImageApp.getFondoV,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  /*Expanded(
                    child: ListCodeSavingsAccount(
                      screenSize: screenSize,
                      smallSpacing: smallSpacing,
                      topPadding: topPadding,
                      itenCount: count1,
                      textAmount: firstAmount1,
                      codeOperation: firstOperation1,
                      codMoney: firstCodMoney1,
                      img: Image.asset(
                        AssetImageApp.getFondoN,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),*/
                ],
              );
            },
          ),
    );
  }
}

class ListCodeSavingsAccount extends StatelessWidget {
  const ListCodeSavingsAccount({
    super.key,
    required this.screenSize,
    required this.smallSpacing,
    required this.topPadding,
    required this.itenCount,
    required this.textAmount,
    required this.codeOperation,
    required this.codMoney,
    required this.img,
  });

  final Size screenSize;
  final double smallSpacing;
  final double topPadding;
  final int? itenCount;
  final double? textAmount;
  final String? codeOperation;
  final String? codMoney;
  final Image img;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itenCount ?? 0, //state?.data.listCodeSavingsAccount.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: screenSize.width * 0.9,
          child: Card(
            margin: EdgeInsetsDirectional.all(8),
            elevation: smallSpacing * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  img,
                  Padding(
                    padding: EdgeInsets.all(topPadding * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SALDO',
                              textAlign: TextAlign.start,
                              style: AppTextStyles.mainStyleWhite14Bold(
                                context,
                              ),
                            ),
                            Text(
                              '$textAmount $codMoney',
                              //'${res?.availableAmount}  ${res?.codMoney}',
                              style: AppTextStyles.mainStyleWhite25Bold(
                                context,
                              ),
                            ),
                            Text(
                              'ESTADO:\nCUENTA DE AHORRO:',
                              style: AppTextStyles.mainStyleWhite14Bold(
                                context,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\n\n\nACTIVO\n$codeOperation',
                              style: AppTextStyles.mainStyleWhite14Bold(
                                context,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.sticky_note_2_outlined,
                              color: Theme.of(context).colorScheme.white,
                            ),
                            SizedBox(height: smallSpacing * 0.8),
                            Icon(
                              Icons.remove_red_eye,
                              color: Theme.of(context).colorScheme.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
