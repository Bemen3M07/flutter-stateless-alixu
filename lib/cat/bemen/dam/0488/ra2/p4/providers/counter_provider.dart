import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0;   //valor inicial de counter

  int get counter => _counter; //getter para obtener el valor de counter
  void increment() {
    _counter++; //incrementar counter en 1
    notifyListeners(); //notificar a los listeners que el valor ha cambiado
  }

  void reset() {
    _counter = 0; //reiniciar counter a 0
    notifyListeners(); //notificar a los listeners que el valor ha cambiado
  }
}