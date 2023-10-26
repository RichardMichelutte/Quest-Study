import 'package:flutter/material.dart';

class Configuracao with ChangeNotifier {
  bool _corBack = true;
  double _fontTamanho = 23;
  double _quantRespo = 0;

  bool get corBack => _corBack;

  set corBack(bool newValue) {
    _corBack = newValue;
    notifyListeners();
  }

  double get fontTamanho => _fontTamanho;

  set fontTamanho(double newValue) {
    _fontTamanho = newValue;
    notifyListeners();
  }

  double get quantRespo => _quantRespo;

  set quantRespo(double newValue) {
    _quantRespo = newValue;
    notifyListeners();
  }
}

