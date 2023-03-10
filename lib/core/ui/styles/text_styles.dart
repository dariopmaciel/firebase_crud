import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();
  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => "mplus1";

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: font);

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: font);

  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: font);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.w700, fontFamily: font);

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: font);

  //ISTO
  TextStyle get textButtomLabel => textBold.copyWith(fontSize: 14);
  //É IGUAL A ISTO
  //TextStyle get textButtomLabel => TextStyle(fontWeight: FontWeight.w700, fontFamily: font, fontSize: 14);
}

//extenção para enviar as os estilos de texto, para as BuildContexts
extension TextStyleExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
