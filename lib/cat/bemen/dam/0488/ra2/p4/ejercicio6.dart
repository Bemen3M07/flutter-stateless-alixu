import 'package:flutter/material.dart';//Importa la librería “material.dart”, que contiene todos los widgets y estilos del Material Design (el estilo visual de Google)


void main() {
  runApp(const Exercici6App()); //Función principal que inicia la aplicación llamando a runApp con el widget raíz SecretNumberApp
}

class Exercici6App extends StatelessWidget { 
  const Exercici6App({super.key}); //Crea el estado asociado al widget SecretNumberPage

  @override
  Widget build(BuildContext context) { //Método build que construye la interfaz de usuario
    return const MaterialApp( 
      debugShowCheckedModeBanner: false, //Elimina la etiqueta de depuración
      home: Exercici6(), //Página principal de la aplicación
    );
  }
}

class ItemCompra {
  final String nom; //Nombre del producto
  final int quantitat; //Cantidad del producto

  ItemCompra(this.nom, this.quantitat); //Constructor de la clase ItemCompra
}

class Exercici6 extends StatefulWidget {  
  const Exercici6({super.key}); //Crea el estado asociado al widget SecretNumberPage

  @override
  State<Exercici6> createState() => _Exercici6State();  //Crea el estado asociado al widget SecretNumberPage
}

class _Exercici6State extends State<Exercici6> {  //Estado asociado al widget Exercici6
  final TextEditingController nomController = TextEditingController();  //Controlador para el campo de texto del nombre del producto
  final TextEditingController quantController = TextEditingController();  //Controlador para el campo de texto de la cantidad del producto

  final List<ItemCompra> llista = []; //Lista de items de compra

  void afegirItem() {
    final nom = nomController.text.trim();  //Obtiene y limpia el texto del campo de nombre
    final quantText = quantController.text.trim();  //Obtiene y limpia el texto del campo de cantidad

    if (nom.isEmpty || quantText.isEmpty) return; //Verifica que los campos no estén vacíos

    final quant = int.tryParse(quantText);    //Intenta convertir el texto de cantidad a un entero
    if (quant == null) return;  //Verifica que la conversión haya sido exitosa

    setState(() {
      llista.add(ItemCompra(nom, quant)); //Agrega un nuevo item a la lista de compras
    });

    nomController.clear();  //Limpia el campo de texto del nombre
    quantController.clear();  //Limpia el campo de texto de la cantidad
  }

  void eliminarItem(int index) {  //Elimina un item de la lista en la posición dada
    setState(() {
      llista.removeAt(index); //Elimina el item en la posición index
    });
  }

  @override
  Widget build(BuildContext context) {  //Método build que construye la interfaz de usuario
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercici 6 – Shopping List"),  //Título de la aplicación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),  //Padding de 16 píxeles en todos los lados
        child: Column(
          children: [
            TextField(
              controller: nomController,  //Controlador para el campo de texto del nombre del producto
              decoration: const InputDecoration(  //Decoración del campo de texto
                labelText: "Nom del producte",  //Etiqueta del campo de texto
                border: OutlineInputBorder(), //Borde del campo de texto
              ),
            ),
            const SizedBox(height: 10), //Espacio vertical de 10 píxeles
            TextField(
              controller: quantController,  //Controlador para el campo de texto de la cantidad del producto
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(  //Decoración del campo de texto
                labelText: "Quantitat",  //Etiqueta del campo de texto
                border: OutlineInputBorder(), //Borde del campo de texto
              ),
            ),
            const SizedBox(height: 10), //Espacio vertical de 10 píxeles
            ElevatedButton(
              onPressed: afegirItem,  //Acción al presionar el botón para agregar un item
              child: const Text("Afegir"),  //Texto del botón
            ),
            const SizedBox(height: 20), //Espacio vertical de 20 píxeles
            Expanded(
              child: ListView.builder(  //Lista de items de compra
                itemCount: llista.length, //Número de items en la lista
                itemBuilder: (context, index) { 
                  final item = llista[index]; //Obtiene el item en la posición index

                  return ListTile(
                    title: Text(item.nom),  //Nombre del producto
                    subtitle: Text("Quantitat: ${item.quantitat}"),  //Cantidad del producto
                    trailing: IconButton(  //Botón para eliminar el item
                      icon: const Icon(Icons.delete, color: Colors.red),  //Icono de eliminar con color rojo
                      onPressed: () => eliminarItem(index), //Acción al presionar el botón para eliminar el item
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
