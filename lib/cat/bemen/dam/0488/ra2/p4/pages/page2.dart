import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      //se muestra el valor de counter de page 1
      child: Text(
        context.watch<CounterProvider>().counter.toString(),
        style: const TextStyle(fontSize: 50),
      ),
    );
  }
}

