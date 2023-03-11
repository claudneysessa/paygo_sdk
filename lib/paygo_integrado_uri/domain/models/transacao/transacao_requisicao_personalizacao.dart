import 'dart:convert';

class TransacaoRequisicaoPersonalizacao {
  String screenBackgroundColor;
  String keyboardBackgroundColor;
  String toolbarBackgroundColor;
  String fontColor;
  String editboxBackgroundColor;
  String releasedKeyColor;
  String pressedKeyColor;
  String keyboardFontColor;
  String menuSeparatorColor;
  String toolbarIcon;
  String font;

  TransacaoRequisicaoPersonalizacao({
    this.screenBackgroundColor = '#F4F4F4',
    this.keyboardBackgroundColor = '#F4F4F4',
    this.toolbarBackgroundColor = '#242424',
    this.fontColor = '#000000',
    this.editboxBackgroundColor = '#FFFFFF',
    this.releasedKeyColor = '#dedede',
    this.pressedKeyColor = '#e1e1e1',
    this.keyboardFontColor = '#000000',
    this.menuSeparatorColor = '#F4F4F4',
    this.toolbarIcon = '',
    this.font = '',
  });

  String obterUri() {
    String urlTransacaoRequisicaoPersonalizacao = 'app://payment/posCustomization?';

    urlTransacaoRequisicaoPersonalizacao +=
        (screenBackgroundColor.trim() != '') ? 'screenBackgroundColor=$screenBackgroundColor&' : '';
    urlTransacaoRequisicaoPersonalizacao +=
        (keyboardBackgroundColor.trim() != '') ? 'keyboardBackgroundColor=$keyboardBackgroundColor&' : '';
    urlTransacaoRequisicaoPersonalizacao +=
        (toolbarBackgroundColor.trim() != '') ? 'toolbarBackgroundColor=$toolbarBackgroundColor&' : '';
    urlTransacaoRequisicaoPersonalizacao += (fontColor.trim() != '') ? 'fontColor=$fontColor&' : '';
    urlTransacaoRequisicaoPersonalizacao +=
        (editboxBackgroundColor.trim() != '') ? 'editboxBackgroundColor=$editboxBackgroundColor&' : '';
    urlTransacaoRequisicaoPersonalizacao +=
        (releasedKeyColor.trim() != '') ? 'releasedKeyColor=$releasedKeyColor&' : '';
    urlTransacaoRequisicaoPersonalizacao += (pressedKeyColor.trim() != '') ? 'pressedKeyColor=$pressedKeyColor&' : '';
    urlTransacaoRequisicaoPersonalizacao +=
        (keyboardFontColor.trim() != '') ? 'keyboardFontColor=$keyboardFontColor&' : '';
    urlTransacaoRequisicaoPersonalizacao +=
        (menuSeparatorColor.trim() != '') ? 'menuSeparatorColor=$menuSeparatorColor&' : '';
    urlTransacaoRequisicaoPersonalizacao += (toolbarIcon.trim() != '') ? 'toolbarIcon=$toolbarIcon&' : '';
    urlTransacaoRequisicaoPersonalizacao += (font.trim() != '') ? 'font=$font&' : '';

    return urlTransacaoRequisicaoPersonalizacao.replaceAll('#', '%23');
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'screenBackgroundColor': screenBackgroundColor,
      'keyboardBackgroundColor': keyboardBackgroundColor,
      'toolbarBackgroundColor': toolbarBackgroundColor,
      'fontColor': fontColor,
      'editboxBackgroundColor': editboxBackgroundColor,
      'releasedKeyColor': releasedKeyColor,
      'pressedKeyColor': pressedKeyColor,
      'keyboardFontColor': keyboardFontColor,
      'menuSeparatorColor': menuSeparatorColor,
      'toolbarIcon': toolbarIcon,
      'font': font,
    };
  }

  factory TransacaoRequisicaoPersonalizacao.fromMap(Map<String, dynamic> map) {
    return TransacaoRequisicaoPersonalizacao(
      screenBackgroundColor: map['screenBackgroundColor'] as String,
      keyboardBackgroundColor: map['keyboardBackgroundColor'] as String,
      toolbarBackgroundColor: map['toolbarBackgroundColor'] as String,
      fontColor: map['fontColor'] as String,
      editboxBackgroundColor: map['editboxBackgroundColor'] as String,
      releasedKeyColor: map['releasedKeyColor'] as String,
      pressedKeyColor: map['pressedKeyColor'] as String,
      keyboardFontColor: map['keyboardFontColor'] as String,
      menuSeparatorColor: map['menuSeparatorColor'] as String,
      toolbarIcon: map['toolbarIcon'] as String,
      font: map['font'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransacaoRequisicaoPersonalizacao.fromJson(String source) =>
      TransacaoRequisicaoPersonalizacao.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant TransacaoRequisicaoPersonalizacao other) {
    if (identical(this, other)) return true;

    return other.screenBackgroundColor == screenBackgroundColor &&
        other.keyboardBackgroundColor == keyboardBackgroundColor &&
        other.toolbarBackgroundColor == toolbarBackgroundColor &&
        other.fontColor == fontColor &&
        other.editboxBackgroundColor == editboxBackgroundColor &&
        other.releasedKeyColor == releasedKeyColor &&
        other.pressedKeyColor == pressedKeyColor &&
        other.keyboardFontColor == keyboardFontColor &&
        other.menuSeparatorColor == menuSeparatorColor &&
        other.toolbarIcon == toolbarIcon &&
        other.font == font;
  }

  @override
  int get hashCode {
    return screenBackgroundColor.hashCode ^
        keyboardBackgroundColor.hashCode ^
        toolbarBackgroundColor.hashCode ^
        fontColor.hashCode ^
        editboxBackgroundColor.hashCode ^
        releasedKeyColor.hashCode ^
        pressedKeyColor.hashCode ^
        keyboardFontColor.hashCode ^
        menuSeparatorColor.hashCode ^
        toolbarIcon.hashCode ^
        font.hashCode;
  }

  @override
  String toString() {
    return 'TransacaoRequisicaoPersonalizacao(screenBackgroundColor: $screenBackgroundColor, keyboardBackgroundColor: $keyboardBackgroundColor, toolbarBackgroundColor: $toolbarBackgroundColor, fontColor: $fontColor, editboxBackgroundColor: $editboxBackgroundColor, releasedKeyColor: $releasedKeyColor, pressedKeyColor: $pressedKeyColor, keyboardFontColor: $keyboardFontColor, menuSeparatorColor: $menuSeparatorColor, toolbarIcon: $toolbarIcon, font: $font)';
  }
}
