enum TransactionStatus {
  confirmadoAutomatico,
  confirmadoManual,
  desfeitoManual,
}

extension TransactionStatusExtension on TransactionStatus {
  String get requisicaoTransactionStatusString {
    switch (this) {
      case TransactionStatus.confirmadoAutomatico:
        return 'CONFIRMADO_AUTOMATICO';
      case TransactionStatus.confirmadoManual:
        return 'CONFIRMADO_MANUAL';
      case TransactionStatus.desfeitoManual:
        return 'DESFEITO_MANUAL';
    }
  }
}
