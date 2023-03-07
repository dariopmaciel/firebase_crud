import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => Color(0xff1A4CAB);
  Color get secondary => Color(0xffD13333);
  Color get tertiary => Colors.black;
  Color get quatyary => Colors.white;
}

//extenção para enviar as cores, primaria e secundário, para as BuildContexts
extension ColorsAppExcetiens on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
