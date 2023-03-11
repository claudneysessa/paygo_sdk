enum CurrencyCode {
  iso4217Real,
  iso4217Dolar,
  iso4217Euro,
}

extension CurrencyCodeExtension on CurrencyCode {
  int get currencyCodeInt {
    switch (this) {
      case CurrencyCode.iso4217Real:
        return 986;
      case CurrencyCode.iso4217Dolar:
        return 840;
      case CurrencyCode.iso4217Euro:
        return 978;
    }
  }

  String get currencyCodeString {
    switch (this) {
      case CurrencyCode.iso4217Real:
        return '986';
      case CurrencyCode.iso4217Dolar:
        return '840';
      case CurrencyCode.iso4217Euro:
        return '978';
    }
  }
}
