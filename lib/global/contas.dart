import 'package:flutter/material.dart';

class Conta  with ChangeNotifier {
  String _email='admin@gmail.com';
  String _senha='admin';
  String _nome='admin';

  String get email => _email;
  String get senha => _senha;
  String get nome => _nome;

  set email(String newValue) {
    _email = newValue;
    notifyListeners();
  }
  set senha(String newValue) {
    _senha = newValue;
    notifyListeners();
  }
  set nome(String newValue) {
    _nome = newValue;
    notifyListeners();
  }

}
