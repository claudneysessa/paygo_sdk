enum FinType {
  financiamentoNaoDefinido,
  aVista,
  parceladoEmissor,
  parceladoEstabelecimento,
  preDatado,
  creditoEmissor,
}

extension FinTypeExtension on FinType {
  String get finTypeString {
    switch (this) {
      case FinType.financiamentoNaoDefinido:
        return 'FINANCIAMENTO_NAO_DEFINIDO';
      case FinType.aVista:
        return 'A_VISTA';
      case FinType.parceladoEmissor:
        return 'PARCELADO_EMISSOR';
      case FinType.parceladoEstabelecimento:
        return 'PARCELADO_ESTABELECIMENTO';
      case FinType.preDatado:
        return 'PRE_DATADO';
      case FinType.creditoEmissor:
        return 'CREDITO_EMISSOR';
    }
  }
}
