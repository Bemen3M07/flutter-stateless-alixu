import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// --- ARXIU: ejercicio8.dart ---
void main(List<String> args) {
  runEjercicio8();
}
// Funció per iniciar aquesta aplicació, cridada des de main.dart
void runEjercicio8() {
  runApp(const MyApp());
}

// Definició de la classe del Provider per a gestionar l'estat de la navegació
class NavigationProvider with ChangeNotifier {
  int _currentPageIndex = 0; // 0: Pàgina 1 (Stateless), 1: Pàgina 2 (Stateful)
  int _statelessExerciseIndex = 0; // Índex de l'exercici seleccionat a la Pàgina 1 (0 a 6)
  int _statefulExerciseIndex = 0; // Índex de l'exercici seleccionat a la Pàgina 2 (0 a 6)

  // Getters
  int get currentPageIndex => _currentPageIndex;
  int get currentStatelessExerciseIndex => _statelessExerciseIndex;
  int get currentStatefulExerciseIndex => _statefulExerciseIndex;

  // Setter per canviar la pàgina principal (BottomNavigationBar)
  void setPageIndex(int index) {
    if (_currentPageIndex != index) {
      _currentPageIndex = index;
      notifyListeners();
    }
  }

  // Setter per canviar l'exercici a la Pàgina 1
  void setStatelessExercise(int index) {
    _statelessExerciseIndex = index;
    notifyListeners();
  }

  // Setter per canviar l'exercici a la Pàgina 2
  void setStatefulExercise(int index) {
    _statefulExerciseIndex = index;
    notifyListeners();
  }
}

// Classe base per als exercicis, actua com a placeholder
class PlaceholderScreen extends StatelessWidget {
  final String title;
  final String type;

  const PlaceholderScreen({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == 'Stateless' ? Icons.pages : Icons.refresh,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Aquí aniria la implementació de l\'$title.',
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Pàgina 1: Exercicis Stateless (Exercicis 1 al 7)
class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  // Llista de widgets d'exercicis a la Pàgina 1
  static final List<Widget> _statelessExercises = List.generate(7, (index) {
    return PlaceholderScreen(
      title: 'Exercici ${index + 1}',
      type: 'Stateless',
    );
  });

  @override
  Widget build(BuildContext context) {
    // Escolta els canvis del provider per obtenir l'índex de l'exercici actual
    final navProvider = Provider.of<NavigationProvider>(context);

    // Crea la llista d'opcions per al DropdownButton
    final List<DropdownMenuItem<int>> menuItems = List.generate(7, (index) {
      return DropdownMenuItem(
        value: index,
        child: Text('Exercici ${index + 1}'),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pàgina 1: Exercicis Stateless'),
        backgroundColor: Colors.lightBlue,
        actions: [
          // Selector de menú superior
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<int>(
              value: navProvider.currentStatelessExerciseIndex,
              onChanged: (int? newIndex) {
                if (newIndex != null) {
                  navProvider.setStatelessExercise(newIndex);
                }
              },
              items: menuItems,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              dropdownColor: Colors.lightBlue.shade700,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              underline: Container(), // Elimina la línia inferior
            ),
          ),
        ],
      ),
      // Mostra l'exercici seleccionat
      body: _statelessExercises[navProvider.currentStatelessExerciseIndex],
    );
  }
}

// Pàgina 2: Exercicis Stateful (Exercicis 1 al 7)
class StatefulPage extends StatelessWidget {
  const StatefulPage({super.key});

  // Llista de widgets d'exercicis a la Pàgina 2
  static final List<Widget> _statefulExercises = List.generate(7, (index) {
    return PlaceholderScreen(
      title: 'Exercici ${index + 1}',
      type: 'Stateful',
    );
  });

  @override
  Widget build(BuildContext context) {
    // Escolta els canvis del provider per obtenir l'índex de l'exercici actual
    final navProvider = Provider.of<NavigationProvider>(context);

    // Crea la llista d'opcions per al DropdownButton
    final List<DropdownMenuItem<int>> menuItems = List.generate(7, (index) {
      return DropdownMenuItem(
        value: index,
        child: Text('Exercici ${index + 1}'),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pàgina 2: Exercicis Stateful'),
        backgroundColor: Colors.green,
        actions: [
          // Selector de menú superior
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: DropdownButton<int>(
              value: navProvider.currentStatefulExerciseIndex,
              onChanged: (int? newIndex) {
                if (newIndex != null) {
                  navProvider.setStatefulExercise(newIndex);
                }
              },
              items: menuItems,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              dropdownColor: Colors.green.shade700,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              underline: Container(), // Elimina la línia inferior
            ),
          ),
        ],
      ),
      // Mostra l'exercici seleccionat
      body: _statefulExercises[navProvider.currentStatefulExerciseIndex],
    );
  }
}

// Widget principal que embolcalla l'aplicació amb el Provider
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'Navegació amb Provider (Exercici 8)',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const NavigationHandler(),
      ),
    );
  }
}

// Widget que gestiona la navegació de la barra inferior
class NavigationHandler extends StatelessWidget {
  const NavigationHandler({super.key});

  // Llista de les pàgines principals
  static const List<Widget> _pages = <Widget>[
    StatelessPage(),
    StatefulPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Utilitza Consumer per reconstruir només quan l'índex de la pàgina canvia
    return Consumer<NavigationProvider>(
      builder: (context, navProvider, child) {
        return Scaffold(
          // El cos de Scaffold es defineix amb el widget de la pàgina actual
          body: _pages[navProvider.currentPageIndex],

          // Barra de navegació inferior
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navProvider.currentPageIndex,
            onTap: (index) {
              // Utilitza el setter del provider per canviar la pàgina
              navProvider.setPageIndex(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.layers_clear),
                label: 'Pàgina 1 (Stateless)',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.storage),
                label: 'Pàgina 2 (Stateful)',
              ),
            ],
            selectedItemColor: navProvider.currentPageIndex == 0 ? Colors.lightBlue : Colors.green,
          ),
        );
      },
    );
  }
}