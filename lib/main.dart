import 'package:flutter/material.dart';

// Importa tu ejercicio (ajusta la ruta si es necesario)
import 'cat/bemen/dam/0488/ra2/p4/ejercicio4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejercicio4(), // ← ARRANCA directamente el ejercicio 4
    );
  }
}
