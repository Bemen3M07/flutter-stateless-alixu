import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const ejercicio7(),
    ),
  );
}

// PROVEEDOR (LÓGICA DE ESTADO)
class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}

// WIDGET PRINCIPAL (DEBE LLAMARSE EXACTAMENTE "ejercicio7")
class ejercicio7 extends StatelessWidget {
  const ejercicio7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ejercicio7 – Provider Counter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Contador amb Provider",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // LECTURA DEL VALOR DES DE PROVIDER
              Consumer<CounterProvider>(
                builder: (_, counterProvider, __) {
                  return Text(
                    "${counterProvider.counter}",
                    style: const TextStyle(fontSize: 60),
                  );
                },
              ),

              const SizedBox(height: 40),

              // BOTONES
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // -1
                  IconButton(
                    onPressed: () {
                      Provider.of<CounterProvider>(context, listen: false)
                          .decrement();
                    },
                    icon: const Icon(Icons.remove),
                    iconSize: 40,
                  ),
                  const SizedBox(width: 20),

                  // +1
                  IconButton(
                    onPressed: () {
                      Provider.of<CounterProvider>(context, listen: false)
                          .increment();
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 40,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // RESET
              ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context, listen: false).reset();
                },
                child: const Text("Reset"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
