import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:paygo_sdk_example/commons/widgets/buttons/button_default.dart';
import 'package:paygo_sdk_example/presentation/views/home_controller.dart';

import '../../commons/widgets/style/application_colors.dart';

class HomeView extends StatefulWidget {
  final String title = 'Exemplo PayGO URI';

  const HomeView({Key? key}) : super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      backgroundColor: ApplicationColors.paygoDark[900],
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Status do Channel',
                            icone: FontAwesomeIcons.bolt,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeStatusChannelClick,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Menu Administrativo',
                            icone: FontAwesomeIcons.bolt,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeAdministrativoclick,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Configurações',
                            icone: FontAwesomeIcons.gears,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeConfiguracaoClick,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Manutenção',
                            icone: FontAwesomeIcons.toolbox,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeManutencaoClick,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Instalação',
                            icone: FontAwesomeIcons.hourglassEnd,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeInstalacaoClick,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Versão',
                            icone: FontAwesomeIcons.info,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeVersaoClick,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Teste de Comunicação',
                            icone: FontAwesomeIcons.arrowsTurnToDots,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeTesteComunicacaoClick,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Exibir PDC',
                            icone: FontAwesomeIcons.idCard,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeExibirPdcClick,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          height: 60,
                          child: ButtonDefault(
                            label: 'Venda',
                            icone: FontAwesomeIcons.cartShopping,
                            primaryColor: ApplicationColors.paygoYellow,
                            secondaryColor: ApplicationColors.paygoDark,
                            onTap: controller.homeVendaClick,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 35,
                color: ApplicationColors.paygoDark[900],
                child: const Center(
                  child: Text(
                    'Versão: 1.0.0.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
