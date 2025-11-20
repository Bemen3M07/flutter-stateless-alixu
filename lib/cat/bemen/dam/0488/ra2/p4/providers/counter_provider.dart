import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  //inicializar counter a 0
  int _counter = 0;

  int get counter => _counter;
  //funcion para sumar +1 a counter cada vez que se llame a la función
  void increment() {
    _counter++;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}