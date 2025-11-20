import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Imports relatives — ajustats per a la ubicació d'aquest fitxer (està dins ...\p4\)
import '../p3-exercici1/hello_world.dart';
import '../p3-exercici1/main_2.dart';
import '../p3-exercici1/main_3.dart';
import '../p3-exercici1/main_4.dart';
import '../p3-exercici1/main_5.dart';
import '../p3-exercici1/main_6.dart';

// Stateful exercises (mateixa carpeta p4)
import 'ejercicio1.dart';
import 'ejercicio2.dart';
import 'ejercicio3.dart';
import 'ejercicio4.dart';
import 'ejercicio5.dart';
import 'ejercicio6.dart';
import 'main_ej7.dart';

void main() => runEjercicio8();
void runEjercicio8() => runApp(const MyApp());

class NavigationProvider with ChangeNotifier {
  int page = 0; // 0 = Stateless, 1 = Stateful
  int statelessIndex = 0;
  int statefulIndex = 0;

  void setPage(int i) {
    page = i;
    notifyListeners();
  }

  void setSL(int i) {
    statelessIndex = i;
    notifyListeners();
  }

  void setSF(int i) {
    statefulIndex = i;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavigationHandler(),
      ),
    );
  }
}

class NavigationHandler extends StatelessWidget {
  const NavigationHandler({super.key});
  static const pages = [StatelessPage(), StatefulPage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, nav, child) => Scaffold(
        body: pages[nav.page],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: nav.page,
          onTap: nav.setPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.layers_clear), label: 'Pàgina 1 (Stateless)'),
            BottomNavigationBarItem(icon: Icon(Icons.storage), label: 'Pàgina 2 (Stateful)'),
          ],
          selectedItemColor: nav.page == 0 ? Colors.lightBlue : Colors.green,
        ),
      ),
    );
  }
}

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});
  static final exercises = <Widget>[
    const HelloWorldApp(),
    const Main2App(),
    const Main3App(),
    const Main4App(),
    const Main5App(),
    const Main6App(),
    const Center(child: Text("No hi ha Exercici 7")),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pàgina 1: Exercicis Stateless'),
        backgroundColor: Colors.lightBlue,
        actions: [
          // Dropdown returns int? — assegurem-nos de manejar null amb el wrapper
          DropdownButton<int>(
            value: nav.statelessIndex,
            onChanged: (v) => nav.setSL(v ?? 0),
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
      body: exercises[nav.statelessIndex],
    );
  }
}


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
      body: exercises[nav.statefulIndex],
    );
  }
}