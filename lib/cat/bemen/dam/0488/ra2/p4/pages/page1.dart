import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //MOSTRAMOS EL VALOR DEL CONTADOR
          Text(
            context.watch<CounterProvider>().counter.toString(),
            style: const TextStyle(fontSize: 50),
          ),
          //AQUI ESTA EL BOTON QUE LLAMA A LA FUNCIÓN PARA SUMAR 1 AL CONTADOR
          ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: const Text('Sumar'))
        ],
      ),
    );
  }
}
