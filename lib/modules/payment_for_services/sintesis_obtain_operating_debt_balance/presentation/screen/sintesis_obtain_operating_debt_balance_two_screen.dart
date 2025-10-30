import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/entity.dart';

@RoutePage()
class SintesisObtainOperatingDebtBalanceTwoScreen extends StatefulWidget {
  final List<ColAccountItemDetailEntity> colAccountItemDetail;
  final String codigoCuenta;
  final String nombre;
  final String saldo;
  final String name;
  const SintesisObtainOperatingDebtBalanceTwoScreen({
    super.key,
    required this.colAccountItemDetail,
    required this.codigoCuenta,
    required this.nombre,
    required this.saldo,
    required this.name,
  });

  @override
  State<SintesisObtainOperatingDebtBalanceTwoScreen> createState() =>
      _SintesisObtainOperatingDebtBalanceTwoScreenState();
}

class _SintesisObtainOperatingDebtBalanceTwoScreenState
    extends State<SintesisObtainOperatingDebtBalanceTwoScreen> {
  late List<bool> isCheckedList;
  late List<TextEditingController> amountControllers;

  @override
  void initState() {
    super.initState();

    isCheckedList = List.filled(widget.colAccountItemDetail.length, false);

    amountControllers = List.generate(
      widget.colAccountItemDetail.length,
      (_) => TextEditingController(),
    );
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.white,
        backgroundColor: Theme.of(context).colorScheme.green,
        title: Text(
          widget.name,
          style: AppTextStyles.mainStyleWhite18Bold(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(topPadding * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Código cuenta:\n'
                  'Nombre cuenta:',
                  style: AppTextStyles.mainStyleGreen14Bold(context),
                ),
                SizedBox(width: smallSpacing * 0.5),
                Text(
                  '${widget.codigoCuenta}\n'
                  '${widget.nombre}',
                ),
              ],
            ),
            Text(
              widget.saldo,
              style: AppTextStyles.mainStyleGreen14Bold(context),
            ),
            SizedBox(height: smallSpacing * 0.5),
            Text(
              'Seleccione la(s) deuda(s) que desea pagar.',
              style: AppTextStyles.mainStyleGreen14Bold(context),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: smallSpacing * 0.5),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.colAccountItemDetail.length,
              itemBuilder: (BuildContext context, int index) {
                final res = widget.colAccountItemDetail[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: smallSpacing * 0.5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.green,
                          ),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(topPadding * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Código:\n'
                                        'Detalle:',
                                        style:
                                            AppTextStyles.mainStyleGreen14Bold(
                                              context,
                                            ),
                                      ),
                                      SizedBox(width: smallSpacing * 0.5),
                                      SizedBox(
                                        width: screenSize.width * 0.5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              res.itemNumberCode,
                                              style:
                                                  AppTextStyles.mainStyleGreen14(
                                                    context,
                                                  ),
                                            ),
                                            Text(
                                              res.itemDescription,
                                              style:
                                                  AppTextStyles.mainStyleGreen14(
                                                    context,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Monto:',
                                        style:
                                            AppTextStyles.mainStyleGreen14Bold(
                                              context,
                                            ),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(width: smallSpacing * 0.5),
                                      res.customerDefineAmount
                                          ? SizedBox(
                                              width: screenSize.width * 0.25,
                                              child: TextFormField(
                                                textAlign: TextAlign.start,
                                                controller:
                                                    amountControllers[index],
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Min: ${res.amountMin}',
                                                ),
                                              ),
                                            )
                                          : Text(
                                              '${res.itemAmount}',
                                              style:
                                                  AppTextStyles.mainStyleGreen14(
                                                    context,
                                                  ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                              Checkbox(
                                activeColor: Theme.of(
                                  context,
                                ).colorScheme.green,
                                value: isCheckedList[index],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedList[index] = value ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Spacer(),
            Row(children: [Text('Total a pagar:'), Text('451')]),
            Center(
              child: Butoon1(onTap: () {}, lblTextField: 'CONTINUAR'),
            ),
          ],
        ),
      ),
    );
  }
}
