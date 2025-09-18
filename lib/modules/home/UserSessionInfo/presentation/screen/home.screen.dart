import 'package:app_prodem_v1/config/router/router.dart';
import 'package:app_prodem_v1/config/theme/extension.dart';
import 'package:app_prodem_v1/injector.container.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/bloc/session_info_bloc.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/credit_products/credit_products_screen.dart';
import 'package:app_prodem_v1/modules/home/UserSessionInfo/presentation/screen/savings_products/savings_products_screen.dart';
import 'package:app_prodem_v1/presentation/screen/home/widget/widget.dart';
import 'package:app_prodem_v1/presentation/widget/container02_widget.dart';
import 'package:app_prodem_v1/utils/text_util.dart';
import 'package:app_prodem_v1/utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late PageController pageController;
  int selectedIndex = 0;

  int image = 4;

  @override
  void initState() {
    super.initState();
    bottomIndex();
    pageController = PageController(initialPage: selectedIndex, keepPage: true);
  }

  void pageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  int bottomIndex() {
    if (selectedIndex == 0) {
      return 0;
    }
    return selectedIndex - 1;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double smallSpacing = screenSize.height * 0.02;
    final double letterSize = screenSize.height;
    final double topPadding = screenSize.height * 0.2;
    return BlocProvider(
      create: (context) =>
          InjectorContainer.getIt<SessionInfoBloc>()..add(SessionInfEvent()),
      child: BlocListener<SessionInfoBloc, SessionInfoState>(
        listener: (context, state) {
          // hide any loading snackbar when state changes
          if (state is SessionInfoLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cargando información de sesión...'),
                duration: Duration(hours: 1),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }

          if (state is SessionInfoSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Sesión cargada')));
          }

          if (state is SessionInfoError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error al cargar sesión: ${state.message}'),
              ),
            );
          }
        },
        child: Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: BoxDecoration(
                color:
                    Theme.of(context).appBarTheme.backgroundColor ??
                    Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: AppBar(
                elevation: 0,
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.green,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code_2_rounded,
                      color: Theme.of(context).colorScheme.green,
                    ),
                  ),
                ],
                title: Center(
                  child: Text(
                    'ProdemMovil',
                    style: AppTextStyles.mainStyleGreen25Bold(context),
                  ),
                ),
              ),
            ),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: [
              SizedBox.expand(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ImgVerde(
                            smallSpacing: smallSpacing,
                            screenSize: screenSize,
                            topPadding: topPadding,
                            letterSize: letterSize,
                          ),
                          SizedBox(height: smallSpacing * 0.7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container1(
                                smallSpacing: smallSpacing,
                                screenSize: screenSize,
                                letterSize: letterSize,
                                lblTextField: 'Pago QR',
                                icon: Icons.qr_code_scanner,
                                onTap: () {},
                              ),
                              Container1(
                                screenSize: screenSize,
                                letterSize: letterSize,
                                lblTextField: 'Cobro QR',
                                smallSpacing: smallSpacing,
                                icon: Icons.qr_code_2,

                                onTap: () {},
                              ),
                              Container1(
                                smallSpacing: smallSpacing,
                                letterSize: letterSize,
                                screenSize: screenSize,
                                lblTextField: 'Retiro QR ATM',
                                icon: Icons.qr_code,
                                onTap: () {},
                              ),
                              Container1(
                                smallSpacing: smallSpacing,
                                letterSize: letterSize,
                                screenSize: screenSize,
                                lblTextField: 'Pago de Servicios',
                                icon: Icons.receipt_long,
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: smallSpacing * 0.5),
                          SizedBox(
                            height: screenSize.height * 0.4,
                            width: screenSize.width,
                            child: Stack(
                              children: [
                                Card(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.transparente,
                                  elevation: smallSpacing * 0.5,
                                  child: CarouselSlider(
                                    options: CarouselOptions(
                                      height: screenSize.height * 0.4,
                                      autoPlay: true,
                                      aspectRatio: 16 / 9,
                                      enlargeCenterPage: true,
                                      viewportFraction: 1.0,
                                    ),
                                    items:
                                        [
                                          Image.asset(AssetImageApp.getFondoV),
                                          Image.asset(AssetImageApp.getFondoV),
                                          Image.asset(AssetImageApp.getFondoV),
                                        ].map((image) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return Container(
                                                height: screenSize.height * 0.4,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      AssetImageApp.getFondoV,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                        radiusCircular(25),
                                                      ),
                                                ),
                                              );
                                            },
                                          );
                                        }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: smallSpacing),
                  ],
                ),
              ),
              SizedBox.expand(child: const SavingsProductsScreen()),
              SizedBox.expand(child: const CreditProductsScreen()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomIndex(),
            onTap: (value) {
              pageChanged(value + 1);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.green,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: selectedIndex == 1
                      ? Theme.of(context).colorScheme.green
                      : Colors.grey,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.credit_card,
                  color: selectedIndex == 2
                      ? Theme.of(context).colorScheme.green
                      : Colors.grey,
                ),
                label: '',
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 4,
            onPressed: () {
              pageChanged(0);
            },
            backgroundColor: selectedIndex == 0
                ? Theme.of(context).colorScheme.green
                : Colors.grey.shade400,
            child: const Icon(Icons.home, color: Colors.white),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
