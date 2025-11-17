import 'package:flutter/material.dart';

void main() {
  runApp(const Exercici6App());
}

class Exercici6App extends StatelessWidget {
  const Exercici6App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Exercici6(),
    );
  }
}

class ItemCompra {
  final String nom;
  final int quantitat;

  ItemCompra(this.nom, this.quantitat);
}

class Exercici6 extends StatefulWidget {
  const Exercici6({super.key});

  @override
  State<Exercici6> createState() => _Exercici6State();
}

class _Exercici6State extends State<Exercici6> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController quantController = TextEditingController();

  final List<ItemCompra> llista = [];

  void afegirItem() {
    final nom = nomController.text.trim();
    final quantText = quantController.text.trim();

    if (nom.isEmpty || quantText.isEmpty) return;

    final quant = int.tryParse(quantText);
    if (quant == null) return;

    setState(() {
      llista.add(ItemCompra(nom, quant));
    });

    nomController.clear();
    quantController.clear();
  }

  void eliminarItem(int index) {
    setState(() {
      llista.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercici 6 – Shopping List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomController,
              decoration: const InputDecoration(
                labelText: "Nom del producte",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: quantController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Quantitat",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: afegirItem,
              child: const Text("Afegir"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: llista.length,
                itemBuilder: (context, index) {
                  final item = llista[index];

                  return ListTile(
                    title: Text(item.nom),
                    subtitle: Text("Quantitat: ${item.quantitat}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => eliminarItem(index),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
