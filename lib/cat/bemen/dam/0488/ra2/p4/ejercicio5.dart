import 'package:flutter/material.dart';

void main() {
  runApp(const ejercicio5());
}

class ejercicio5 extends StatefulWidget {
  const ejercicio5({super.key});

  @override
  State<ejercicio5> createState() => _ejercicio5State();
}

class _ejercicio5State extends State<ejercicio5> {
  int local = 0;
  int visitante = 0;

  void reset() {
    setState(() {
      local = 0;
      visitante = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ejercicio5 – Marcador"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ------- LOCAL -------
            const Text(
              "Local",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "$local",
              style: const TextStyle(fontSize: 60),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  local++;
                });
              },
              child: const Text("+1 Local"),
            ),

            const SizedBox(height: 40),

            // ------- VISITANTE -------
            const Text(
              "Visitante",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "$visitante",
              style: const TextStyle(fontSize: 60),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  visitante++;
                });
              },
              child: const Text("+1 Visitante"),
            ),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: reset,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
