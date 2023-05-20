import 'dart:async';

import 'package:get/get.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/models/transacao/transacao_requisicao_confirmacao.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/models/transacao/transacao_requisicao_pendencia.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/card_type.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/fin_type.dart';
import 'package:paygo_sdk/paygo_integrado_uri/domain/types/transaction_status.dart';

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
      intentAction: IntentAction.payment,
      requisicao: TransacaoRequisicaoGenerica(
        operation: Operation.configuracao,
      ),
    );
  }

  Future<void> homeManutencaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      intentAction: IntentAction.payment,
      requisicao: TransacaoRequisicaoGenerica(
        operation: Operation.manutencao,
      ),
    );
  }

  Future<void> homeInstalacaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      intentAction: IntentAction.payment,
      requisicao: TransacaoRequisicaoGenerica(
        operation: Operation.instalacao,
      ),
    );
  }

  Future<void> homeVersaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      intentAction: IntentAction.payment,
      requisicao: TransacaoRequisicaoGenerica(
        operation: Operation.versao,
      ),
    );
  }

  Future<void> homeTesteComunicacaoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      intentAction: IntentAction.payment,
      requisicao: TransacaoRequisicaoGenerica(
        operation: Operation.testeComunicacao,
      ),
    );
  }

  Future<void> homeExibirPdcClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.generico(
      intentAction: IntentAction.payment,
      requisicao: TransacaoRequisicaoGenerica(
        operation: Operation.exibePdc,
      ),
    );
  }

  Future<void> homeVendaClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.venda(
      requisicaoVenda: TransacaoRequisicaoVenda(
        amount: 100.99,
        currencyCode: CurrencyCode.iso4217Real,
      )
        ..provider = "DEMO"
        ..cardType = CardType.cartaoDebito
        ..finType = FinType.aVista
        ..originalTransactionNsu = "1234567890",
    );
  }

  Future<void> homeConfirmarAutomaticoClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.confirmarTransacao(
      intentAction: IntentAction.confirmation,
      requisicao: TransacaoRequisicaoConfirmacao(
        confirmationTransactionId: '0000545544.1060.921091.2965.DEMO',
        status: TransactionStatus.confirmadoAutomatico,
      ),
    );
  }

  Future<void> homeConfirmarManualClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.confirmarTransacao(
      intentAction: IntentAction.confirmation,
      requisicao: TransacaoRequisicaoConfirmacao(
        confirmationTransactionId: '0000545544.1060.921091.2965.DEMO',
        status: TransactionStatus.confirmadoManual,
      ),
    );
  }

  Future<void> homeDesfeitoManualClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.confirmarTransacao(
      intentAction: IntentAction.confirmation,
      requisicao: TransacaoRequisicaoConfirmacao(
        confirmationTransactionId: '---> Aqui vai o ID da Transação <---',
        status: TransactionStatus.desfeitoManual,
      ),
    );
  }

  Future<void> homeResolverPendenciaClick() async {
    PayGOSdk repository = PayGOSdk();
    await repository.integrado.resolucaoPendencia(
      intentAction: IntentAction.confirmation,
      requisicaoPendencia: '---> Aqui vai a URI da Pendência <---',
      requisicaoConfirmacao: TransacaoRequisicaoPendencia(
        status: TransactionStatus.desfeitoManual,
      ),
    );
  }
}
