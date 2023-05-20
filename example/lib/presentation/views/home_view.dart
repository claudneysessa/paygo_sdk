import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:paygo_sdk_example/presentation/views/home_controller.dart';

import '../../commons/widgets/style/application_colors.dart';
import 'components/menu_item_widget.dart';

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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MenuItemWidget(
                              label: 'Status do Channel',
                              onTap: controller.homeStatusChannelClick,
                            ),
                            MenuItemWidget(
                              label: 'Menu Administrativo',
                              onTap: controller.homeAdministrativoclick,
                            ),
                            MenuItemWidget(
                              label: 'Configurações',
                              onTap: controller.homeConfiguracaoClick,
                            ),
                            MenuItemWidget(
                              label: 'Manutenção',
                              onTap: controller.homeManutencaoClick,
                            ),
                            MenuItemWidget(
                              label: 'Instalação',
                              onTap: controller.homeInstalacaoClick,
                            ),
                            MenuItemWidget(
                              label: 'Versão',
                              onTap: controller.homeVersaoClick,
                            ),
                            MenuItemWidget(
                              label: 'Teste de Comunicação',
                              onTap: controller.homeTesteComunicacaoClick,
                            ),
                            MenuItemWidget(
                              label: 'Exibir PDC',
                              onTap: controller.homeExibirPdcClick,
                            ),
                            MenuItemWidget(
                              label: 'Venda',
                              onTap: controller.homeVendaClick,
                            ),
                            MenuItemWidget(
                              label: 'Confirmar Automatico',
                              onTap: controller.homeConfirmarAutomaticoClick,
                            ),
                            MenuItemWidget(
                              label: 'Confirmar Manual',
                              onTap: controller.homeConfirmarManualClick,
                            ),
                            MenuItemWidget(
                              label: 'Desfazer Manual',
                              onTap: controller.homeDesfeitoManualClick,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
      ),
    );
  }
}
