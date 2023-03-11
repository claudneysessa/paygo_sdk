enum CardType {
  cartaoDesconhecido,
  cartaoCredito,
  cartaoDebito,
  cartaoVoucher,
  cartaoPrivateLabel,
  cartaoFrota,
}

extension CardTypeExtension on CardType {
  String get cardTypeString {
    switch (this) {
      case CardType.cartaoDesconhecido:
        return 'CARTAO_DESCONHECIDO';
      case CardType.cartaoCredito:
        return 'CARTAO_CREDITO';
      case CardType.cartaoDebito:
        return 'CARTAO_DEBITO';
      case CardType.cartaoVoucher:
        return 'CARTAO_VOUCHER';
      case CardType.cartaoPrivateLabel:
        return 'CARTAO_PRIVATELABEL';
      case CardType.cartaoFrota:
        return 'CARTAO_FROTA';
    }
  }
}
