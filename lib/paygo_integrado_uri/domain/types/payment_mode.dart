enum PaymentMode {
  pagamentoCartao,
  pagamentoDinheiro,
  pagamentoCheque,
  pagamentoCarteiraVirtual,
}

extension PaymentModeExtension on PaymentMode {
  String get paymentModeString {
    switch (this) {
      case PaymentMode.pagamentoCartao:
        return 'PAGAMENTO_CARTAO';
      case PaymentMode.pagamentoDinheiro:
        return 'PAGAMENTO_DINHEIRO';
      case PaymentMode.pagamentoCheque:
        return 'PAGAMENTO_CHEQUE';
      case PaymentMode.pagamentoCarteiraVirtual:
        return 'PAGAMENTO_CARTEIRA_VIRTUAL';
    }
  }
}
