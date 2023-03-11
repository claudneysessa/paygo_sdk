import 'dart:convert';

class TransacaoRequisicaoDadosAutomacao {
  String posName;
  String posVersion;
  String posDeveloper;
  bool allowCashback;
  bool allowDiscount;
  bool allowDifferentReceipts;
  bool allowShortReceipt;
  bool allowDueAmount;

  TransacaoRequisicaoDadosAutomacao(
    this.posName,
    this.posVersion,
    this.posDeveloper, {
    this.allowCashback = false,
    this.allowDiscount = false,
    this.allowDifferentReceipts = false,
    this.allowShortReceipt = false,
    this.allowDueAmount = false,
  });

  String obterUri() {
    String urlTransacaoRequisicaoDadosAutomacao = 'app://payment/posData?';

    urlTransacaoRequisicaoDadosAutomacao += 'posDeveloper=$posDeveloper&';
    urlTransacaoRequisicaoDadosAutomacao += 'posName=$posName&';
    urlTransacaoRequisicaoDadosAutomacao += 'allowDueAmount=$allowDueAmount&';
    urlTransacaoRequisicaoDadosAutomacao += 'allowDiscount=$allowDiscount&';
    urlTransacaoRequisicaoDadosAutomacao += 'allowCashback=$allowCashback&';
    urlTransacaoRequisicaoDadosAutomacao += 'allowShortReceipt=$allowShortReceipt&';
    urlTransacaoRequisicaoDadosAutomacao += 'allowDifferentReceipts=$allowDifferentReceipts&';
    urlTransacaoRequisicaoDadosAutomacao += 'posVersion=$posVersion';

    return urlTransacaoRequisicaoDadosAutomacao;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posName': posName,
      'posVersion': posVersion,
      'posDeveloper': posDeveloper,
      'allowCashback': allowCashback,
      'allowDiscount': allowDiscount,
      'allowDifferentReceipts': allowDifferentReceipts,
      'allowShortReceipt': allowShortReceipt,
      'allowDueAmount': allowDueAmount,
    };
  }

  factory TransacaoRequisicaoDadosAutomacao.fromMap(Map<String, dynamic> map) {
    return TransacaoRequisicaoDadosAutomacao(
      map['posName'] as String,
      map['posVersion'] as String,
      map['posDeveloper'] as String,
      allowCashback: map['allowCashback'] != null ? map['allowCashback'] as bool : false,
      allowDiscount: map['allowDiscount'] != null ? map['allowDiscount'] as bool : false,
      allowDifferentReceipts: map['allowDifferentReceipts'] != null ? map['allowDifferentReceipts'] as bool : false,
      allowShortReceipt: map['allowShortReceipt'] != null ? map['allowShortReceipt'] as bool : false,
      allowDueAmount: map['allowDueAmount'] != null ? map['allowDueAmount'] as bool : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransacaoRequisicaoDadosAutomacao.fromJson(String source) =>
      TransacaoRequisicaoDadosAutomacao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant TransacaoRequisicaoDadosAutomacao other) {
    if (identical(this, other)) return true;

    return other.posName == posName &&
        other.posVersion == posVersion &&
        other.posDeveloper == posDeveloper &&
        other.allowCashback == allowCashback &&
        other.allowDiscount == allowDiscount &&
        other.allowDifferentReceipts == allowDifferentReceipts &&
        other.allowShortReceipt == allowShortReceipt &&
        other.allowDueAmount == allowDueAmount;
  }

  @override
  int get hashCode {
    return posName.hashCode ^
        posVersion.hashCode ^
        posDeveloper.hashCode ^
        allowCashback.hashCode ^
        allowDiscount.hashCode ^
        allowDifferentReceipts.hashCode ^
        allowShortReceipt.hashCode ^
        allowDueAmount.hashCode;
  }

  @override
  String toString() {
    return 'TransacaoRequisicaoDadosAutomacao(posName: $posName, posVersion: $posVersion, posDeveloper: $posDeveloper, allowCashback: $allowCashback, allowDiscount: $allowDiscount, allowDifferentReceipts: $allowDifferentReceipts, allowShortReceipt: $allowShortReceipt, allowDueAmount: $allowDueAmount)';
  }
}
