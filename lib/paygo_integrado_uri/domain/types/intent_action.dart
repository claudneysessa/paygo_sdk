enum IntentAction {
  payment,
  confirmation,
  interfaceautomacao,
}

extension IntentActionExtension on IntentAction {
  String get intentActionString {
    switch (this) {
      case IntentAction.payment:
        return 'br.com.setis.payment.TRANSACTION';
      case IntentAction.confirmation:
        return 'br.com.setis.confirmation.TRANSACTION';
      case IntentAction.interfaceautomacao:
        return 'br.com.setis.interfaceautomacao.SERVICO';
    }
  }
}
