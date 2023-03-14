import 'dart:async';

import 'package:get/get.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/card_type.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/fin_type.dart';

import 'package:paygo_sdk/paygo_sdk.dart';
import 'package:paygo_sdk_example/presentation/application/application_controller.dart';

class HomeController extends GetxController {
  ApplicationController applicationController = Get.find<ApplicationController>();

  Future<void> homeStatusChannelClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.verificarStatusDoChannel();
  }

  Future<void> homeAdministrativoclick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.administrativo();
  }

  Future<void> homeConfiguracaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.configuracao,
      ),
    );
  }

  Future<void> homeManutencaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.manutencao,
      ),
    );
  }

  Future<void> homeInstalacaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.instalacao,
      ),
    );
  }

  Future<void> homeVersaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.versao,
      ),
    );
  }

  Future<void> homeTesteComunicacaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.testeComunicacao,
      ),
    );
  }

  Future<void> homeExibirPdcClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.exibePdc,
      ),
    );
  }

  Future<void> homeVendaClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.venda(
      TransacaoRequisicaoVenda(
        amount: 100.99,
        currencyCode: CurrencyCode.iso4217Real,
      )
        ..provider = "DEMO"
        ..cardType = CardType.cartaoDebito
        ..finType = FinType.aVista
        ..originalTransactionNsu = "1234567890",
    );
  }
}
