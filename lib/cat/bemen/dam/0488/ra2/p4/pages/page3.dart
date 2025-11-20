import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {


    return Column(
      
      //SE MUESTRA EL VALOR DEL CONTADOR Y BOTÓN PARA RESETEAR
      children: [Text(
        context.watch<CounterProvider>().counter.toString(),
        style: const TextStyle(fontSize: 50),
      ),
      ElevatedButton(
        onPressed: () {
          context.read<CounterProvider>().reset();
        },
        child: const Text('Resetear'),
      )
      ],
    );


  }


}

