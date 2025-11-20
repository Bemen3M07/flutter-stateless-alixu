import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ===== IMPORTS DELS EXERCICIS =====
/// S'importen els widgets que seran mostrats dins d'aquesta app.
/// Els Stateless provenen de la carpeta `p3-exercici1`

import '../p3-exercici1/hello_world.dart';
import '../p3-exercici1/main_2.dart';
import '../p3-exercici1/main_3.dart';
import '../p3-exercici1/main_4.dart';
import '../p3-exercici1/main_5.dart';
import '../p3-exercici1/main_6.dart';

/// Els Stateful provenen de la mateixa carpeta `p4`

import 'ejercicio1.dart';
import 'ejercicio2.dart';
import 'ejercicio3.dart';
import 'ejercicio4.dart';
import 'ejercicio5.dart';
import 'ejercicio6.dart';
import 'main_ej7.dart';

/// =====================
/// 🚀 PUNT D'ENTRADA
/// =====================
/// `main()` executa la funció `runEjercicio8()` que inicia l'app.

void main() => runEjercicio8();
void runEjercicio8() => runApp(const MyApp());

/// ===============================
/// 🧠 PROVIDER (Gestió de Navegació)
/// ===============================
/// Aquesta classe notifica canvis a les pantalles quan es modifica l'estat.
/// Controla:
/// - quina pàgina inferior està seleccionada (Stateless / Stateful)
/// - quin exercici concret s'ha triat dins de cada pàgina

class NavigationProvider with ChangeNotifier {
  int page = 0;            // 0 = Pàgina Stateless, 1 = Pàgina Stateful
  int statelessIndex = 0;  // Índex actual dels exercicis Stateless
  int statefulIndex = 0;   // Índex actual dels exercicis Stateful

  /// Canvia la pàgina inferior (BottomNavigationBar)
  void setPage(int i) {
    page = i;
    notifyListeners(); // Notifica al widget per reconstruir la UI
  }

  /// Canvia l'exercici de la pàgina Stateless
  void setSL(int i) {
    statelessIndex = i;
    notifyListeners();
  }

  /// Canvia l'exercici de la pàgina Stateful
  void setSF(int i) {
    statefulIndex = i;
    notifyListeners();
  }
}

/// =====================
/// 🏠 APP PRINCIPAL
/// =====================
/// `ChangeNotifierProvider` injecta el provider a tota l’aplicació.
/// D’aquesta forma qualsevol widget pot escoltar canvis sense passar paràmetres manualment.

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(), // Es crea el provider
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationHandler(), // Widget principal de navegació
      ),
    );
  }
}

/// =======================================
/// 🌐 HANDLER DE NAVEGACIÓ INFERIOR (BOTTOM BAR)
/// =======================================
/// Gestiona quina pàgina mostrar: Stateless o Stateful.
/// Usa el provider per canviar i reconstruir la UI.

class NavigationHandler extends StatelessWidget {
  const NavigationHandler({super.key});

  // Les dues pantalles disponibles
  static const pages = [StatelessPage(), StatefulPage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      // `Consumer` escolta canvis de `NavigationProvider`
      builder: (context, nav, child) => Scaffold(
        body: pages[nav.page], // Mostra la pàgina segons l'índex
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: nav.page, // Índex seleccionat
          onTap: nav.setPage,     // Quan es toca un botó, canvia la pàgina
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.layers_clear), label: 'Pàgina 1 (Stateless)'),
            BottomNavigationBarItem(icon: Icon(Icons.storage), label: 'Pàgina 2 (Stateful)'),
          ],
          // Canvia el color segons la pàgina activa
          selectedItemColor: nav.page == 0 ? Colors.lightBlue : Colors.green,
        ),
      ),
    );
  }
}

/// ===========================
/// 📄 PÀGINA DELS EXERCICIS STATELESS
/// ===========================
/// Conté un selector superior amb Dropdown + mostra del widget escollit.

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  /// Llista dels widgets que s'executen com a exercicis
  static final exercises = <Widget>[
    const HelloWorldApp(),
    const Main2App(),
    const Main3App(),
    const Main4App(),
    const Main5App(),
    const Main6App(),
    const Center(child: Text("No hi ha Exercici 7")), // Extra placeholder
  ];

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationProvider>(context); // Accés al provider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pàgina 1: Exercicis Stateless'),
        backgroundColor: Colors.lightBlue,
        actions: [
          ///  Selector superior per canviar d'exercici
          DropdownButton<int>(
            value: nav.statelessIndex,          // Valor seleccionat
            onChanged: (v) => nav.setSL(v ?? 0), //  Si v és null, torna al 0
            dropdownColor: Colors.lightBlue,
            underline: Container(),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            style: const TextStyle(color: Colors.white),
            items: List.generate(
              exercises.length,
              (i) => DropdownMenuItem(value: i, child: Text("Exercici ${i + 1}")),
            ),
          ),
        ],
      ),
      body: exercises[nav.statelessIndex], //  Renderització de l’exercici seleccionat
    );
  }
}


/// PÀGINA DELS EXERCICIS STATEFUL

/// Exactament igual que l’anterior però amb exercicis que tenen estat.

class StatefulPage extends StatelessWidget {
  const StatefulPage({super.key});

  static final exercises = <Widget>[
    const Ejercicio1App(),
    const Ejercicio2App(),
    const Ejercicio3App(),
    const Ejercicio4App(),
    const Ejercicio5App(),
    const Ejercicio6App(),
    const Ejercicio7App(),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pàgina 2: Exercicis Stateful'),
        backgroundColor: Colors.green,
        actions: [
          DropdownButton<int>(
            value: nav.statefulIndex,
            onChanged: (v) => nav.setSF(v ?? 0),
            dropdownColor: Colors.green,
            underline: Container(),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            style: const TextStyle(color: Colors.white),
            items: List.generate(
              exercises.length,
              (i) => DropdownMenuItem(value: i, child: Text("Exercici ${i + 1}")),
            ),
          ),
        ],
      ),
      body: exercises[nav.statefulIndex], // Mostra del widget seleccionat
    );
  }
}
