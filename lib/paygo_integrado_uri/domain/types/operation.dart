enum Operation {
  venda,
  administrativa,
  cancelamento,
  instalacao,
  reimpressao,
  relatorioSintetico,
  relatorioDetalhado,
  relatorioResumido,
  testeComunicacao,
  exibePdc,
  versao,
  configuracao,
  manutencao,
  confirmacao,
  resolucaoPendencia,
}

extension OperationExtension on Operation {
  String get requisicaoOperationString {
    switch (this) {
      case Operation.venda:
        return 'VENDA';
      case Operation.administrativa:
        return 'ADMINISTRATIVA';
      case Operation.cancelamento:
        return 'CANCELAMENTO';
      case Operation.instalacao:
        return 'INSTALACAO';
      case Operation.reimpressao:
        return 'REIMPRESSAO';
      case Operation.relatorioSintetico:
        return 'RELATORIO_SINTETICO';
      case Operation.relatorioDetalhado:
        return 'RELATORIO_DETALHADO';
      case Operation.relatorioResumido:
        return 'RELATORIO_RESUMIDO';
      case Operation.testeComunicacao:
        return 'TESTE_COMUNICACAO';
      case Operation.exibePdc:
        return 'EXIBE_PDC';
      case Operation.versao:
        return 'VERSAO';
      case Operation.configuracao:
        return 'CONFIGURACAO';
      case Operation.manutencao:
        return 'MANUTENCAO';
      case Operation.confirmacao:
        return 'CONFIRMACAO';
      case Operation.resolucaoPendencia:
        return 'RESOLUCAO_PENDENCIA';
    }
  }
}
