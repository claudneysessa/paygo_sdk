import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/card_type.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/fin_type.dart';
import 'package:receive_intent/receive_intent.dart' as receive_intent;

import 'package:paygo_sdk/paygo_sdk.dart';
import 'package:paygo_sdk_example/presentation/application/application_controller.dart';

class HomeController extends GetxController {
  late StreamSubscription _subscription;
  ApplicationController applicationController = Get.find<ApplicationController>();

  get subscription => _subscription;

  Future<void> _initReceiveIntent() async {
    _subscription = receive_intent.ReceiveIntent.receivedIntentStream.listen(
      (
        receive_intent.Intent? intent,
      ) {
        if (intent?.data != null) {
          final Uri uri = Uri.parse(intent?.data ?? '');

          final String decodedUri = Uri.decodeFull(
            uri.toString(),
          );

          TransacaoRequisicaoResposta? resposta;
          resposta = TransacaoRequisicaoResposta.fromUri(
            decodedUri,
          );

          Get.defaultDialog(
            title: "Resposta",
            content: Text(
              resposta.resultMessage,
            ),
          );

          applicationController.loggerNoStack.i(
            "Intent Data: ${resposta.toMap()}",
          );
        }
      },
      onError: (err) {
        applicationController.loggerNoStack.e("Erro ao receber Intent");
      },
    );
  }

  Future<void> homeStatusChannelClick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.verificarStatusDoChannel();
  }

  Future<void> homeAdministrativoclick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.administrativo();
  }

  Future<void> homeConfiguracaoClick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.configuracao,
      ),
    );
  }

  Future<void> homeManutencaoClick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.manutencao,
      ),
    );
  }

  Future<void> homeInstalacaoClick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.instalacao,
      ),
    );
  }

  Future<void> homeVersaoClick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.versao,
      ),
    );
  }

  Future<void> homeTesteComunicacaoClick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.testeComunicacao,
      ),
    );
  }

  Future<void> homeExibirPdcClick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.generico(
      TransacaoRequisicaoGenerica(
        operation: Operation.exibePdc,
      ),
    );
  }

  Future<void> homeVendaClick() async {
    PayGOIntegradoRepository repository = PayGOIntegradoRepository();
    await repository.venda(
      TransacaoRequisicaoVenda(
        amount: 100.99,
        currencyCode: CurrencyCode.iso4217Real,
      )
        ..provider = "DEMO"
        ..cardType = CardType.cartaoDebito
        ..finType = FinType.aVista,
    );
  }

  @override
  void onInit() async {
    await _initReceiveIntent();
    super.onInit();
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
