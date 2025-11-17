import 'package:flutter/material.dart';
import 'lib cat/bemen/dam/0488/ra2/p24/ejercicio4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ejercicio4(), // ← aquí lanzamos la pantalla de los dados
    );
  }
}
