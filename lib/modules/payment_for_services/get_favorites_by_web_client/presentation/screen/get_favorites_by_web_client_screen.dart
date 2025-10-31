/*import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/payment_for_services/get_favorites_by_web_client/presentation/bloc/update_delete_favorite_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';

@RoutePage()
class GetFavoritesByWebClientScreen extends StatefulWidget {
  final GetFavoritesByWebClientResponseEntity data;
  const GetFavoritesByWebClientScreen({super.key, required this.data});

  @override
  State<GetFavoritesByWebClientScreen> createState() =>
      _GetFavoritesByWebClientScreenState();
}

class _GetFavoritesByWebClientScreenState
    extends State<GetFavoritesByWebClientScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) => InjectorContainer.getIt<UpdateDeleteFavoriteBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Mis Favoritos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),
        body: BlocBuilder<UpdateDeleteFavoriteBloc, UpdateDeleteFavoriteState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(topPadding * 0.05),
              child: ListView.builder(
                itemCount: widget.data.data.length,
                itemBuilder: (context, index) {
                  final res = widget.data.data[index];
                  return Card(
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nombre Favorito:\n'
                                  'Código:',
                                  style: AppTextStyles.mainStyleGreen14Bold(
                                    context,
                                  ),
                                ),
                                Text(
                                  '${res.favoriteName}\n'
                                  '${res.referenceData}',
                                  style: AppTextStyles.mainStyleGreen14(
                                    context,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    showEditFavoriteDialog(
                                      context,
                                      TextEditingController(
                                        text: res.favoriteName,
                                      ),
                                      res.favoriteName,
                                      res.idFavoritosServicios.toString(),
                                      screenSize,
                                      smallSpacing,
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    color: Theme.of(context).colorScheme.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

void showEditFavoriteDialog(
  BuildContext context,
  TextEditingController controller,
  String currentName,
  String idFavoritosServicios,
  Size screenSize,
  double smallSpacing,
) {
  controller.text = currentName;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Título
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Text(
                "Edite el nombre del favorito",
                textAlign: TextAlign.center,
                style: AppTextStyles.mainStyleGreen14Bold(context),
              ),
            ),
            SizedBox(height: smallSpacing * 0.5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nombre del favorito",
                    style: AppTextStyles.mainStyleGreen14Bold(context),
                  ),
                  SizedBox(height: 6),
                  TextFromFiel01(
                    screenSize: screenSize,
                    smallSpacing: smallSpacing,
                    userController: controller,
                    lbText: 'Nombre del favorito',
                  ),
                ],
              ),
            ),

            SizedBox(height: smallSpacing * 0.5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Butoon1(onTap: () {}, lblTextField: 'CANCELAR'),
                Butoon1(
                  onTap: () {
                    context.read<UpdateDeleteFavoriteBloc>().add(
                      UpdateDeleteFavoEvent(
                        delete: false,
                        favoriteName: controller.text,
                        idFavoritosServicios: idFavoritosServicios,
                      ),
                    );
                  },
                  lblTextField: 'GUARDAR',
                ),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
      );
    },
  );
}*/

import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/payment_for_services/get_favorites_by_web_client/presentation/bloc/update_delete_favorite_bloc.dart';
import 'package:app_prodem_v1/presentation/widget/butoons_widget.dart';
import 'package:app_prodem_v1/presentation/widget/text_from_fiel.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entity.dart';

@RoutePage()
class GetFavoritesByWebClientScreen extends StatefulWidget {
  final GetFavoritesByWebClientResponseEntity data;
  const GetFavoritesByWebClientScreen({super.key, required this.data});

  @override
  State<GetFavoritesByWebClientScreen> createState() =>
      _GetFavoritesByWebClientScreenState();
}

class _GetFavoritesByWebClientScreenState
    extends State<GetFavoritesByWebClientScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double topPadding = screenSize.height * 0.2;

    return BlocProvider(
      create: (context) => InjectorContainer.getIt<UpdateDeleteFavoriteBloc>(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.white,
          backgroundColor: Theme.of(context).colorScheme.green,
          title: Text(
            'Mis Favoritos',
            style: AppTextStyles.mainStyleWhite18Bold(context),
          ),
        ),

        body: BlocListener<UpdateDeleteFavoriteBloc, UpdateDeleteFavoriteState>(
          listener: (context, state) {
            if (state is UpdateDeleteFavoriteSuccess) {
              Navigator.pop(context); // Cierra el dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Nombre actualizado con éxito')),
              );
            }
          },

          child: Padding(
            padding: EdgeInsets.all(topPadding * 0.05),
            child: ListView.builder(
              itemCount: widget.data.data.length,
              itemBuilder: (context, index) {
                final res = widget.data.data[index];

                return Card(
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nombre Favorito:\nCódigo:',
                                style: AppTextStyles.mainStyleGreen14Bold(
                                  context,
                                ),
                              ),
                              Text(
                                '${res.favoriteName}\n${res.referenceData}',
                                style: AppTextStyles.mainStyleGreen14(context),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showEditFavoriteDialog(
                                    context,
                                    TextEditingController(
                                      text: res.favoriteName,
                                    ),
                                    res.idFavoritosServicios.toString(),
                                    screenSize,
                                    smallSpacing,
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Theme.of(context).colorScheme.green,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (dialogContext) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        content: Text(
                                          '¿Desea eliminar el favorito actual?',
                                          style:
                                              AppTextStyles.mainStyleGreen14Bold(
                                                context,
                                              ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'NO',
                                              style:
                                                  AppTextStyles.mainStyleGreen14Bold(
                                                    context,
                                                  ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              context
                                                  .read<
                                                    UpdateDeleteFavoriteBloc
                                                  >()
                                                  .add(
                                                    UpdateDeleteFavoEvent(
                                                      delete: true,
                                                      favoriteName:
                                                          res.favoriteName,
                                                      idFavoritosServicios: res
                                                          .idFavoritosServicios
                                                          .toString(),
                                                    ),
                                                  );
                                            },
                                            child: Text(
                                              'SI',
                                              style:
                                                  AppTextStyles.mainStyleGreen14Bold(
                                                    context,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },

                                icon: Icon(
                                  Icons.delete,
                                  color: Theme.of(context).colorScheme.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

void showEditFavoriteDialog(
  BuildContext context,
  TextEditingController controller,
  String idFavoritosServicios,
  Size screenSize,
  double smallSpacing,
) {
  // ✅ Guardamos la instancia del bloc ANTES del showDialog
  final updateBloc = context.read<UpdateDeleteFavoriteBloc>();

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      // ✅ Le pasamos el mismo bloc al diálogo
      return BlocProvider.value(
        value: updateBloc,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.green,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Edite el nombre del favorito",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.mainStyleWhite16Bold(context),
                  ),
                ),

                SizedBox(height: smallSpacing * 0.5),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nombre del favorito",
                        style: AppTextStyles.mainStyleGreen14Bold(context),
                      ),
                      const SizedBox(height: 6),
                      TextFromFiel01(
                        screenSize: screenSize,
                        smallSpacing: smallSpacing,
                        userController: controller,
                        lbText: 'Nombre del favorito',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: smallSpacing * 0.5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Butoon1(
                      onTap: () => Navigator.pop(dialogContext),
                      lblTextField: 'CANCELAR',
                    ),
                    Butoon1(
                      onTap: () {
                        updateBloc.add(
                          UpdateDeleteFavoEvent(
                            delete: false,
                            idFavoritosServicios: idFavoritosServicios,
                            favoriteName: controller.text,
                          ),
                        );
                      },
                      lblTextField: 'GUARDAR',
                    ),
                  ],
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      );
    },
  );
}
