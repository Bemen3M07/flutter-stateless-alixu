import 'package:flutter/material.dart'; //Importa la librería principal de Flutter con todos los widgets del Material Design.

//Clase Message → representa un mensaje con autor y texto.
class Message {
  final String author; //nombre del autor.
  final String body; //contenido del mensaje.

  Message(this.author, this.body); //constructor que recibe autor y cuerpo.
}

void main() { //función principal que se ejecuta al iniciar la app.
  runApp(const MyApp()); //inicia la aplicación con el widget raíz: MyApp.
}

class MyApp extends StatelessWidget { //widget principal (sin estado).
  const MyApp({super.key}); //constructor.

  @override
  Widget build(BuildContext context) { 
    return MaterialApp( //contiene la estructura general de la app.
      title: ' Lista Ex5', //título de la aplicación.
      home: const MessageListPage(), //pantalla principal (MessageListPage).
    );
  }
}

class MessageListPage extends StatelessWidget { //clase que representa la pantalla con la lista de mensajes.
  const MessageListPage({super.key}); //constructor.

  @override
  Widget build(BuildContext context) {
    //Creamos una lista con 4 mensajes de ejemplo (autor + texto).
    final messages = [
      Message("Emma Atkins", "Hola! Aquest és el meu primer missatge."),
      Message("Alicia Dionicio", "Bon dia! Com va tot?"),
      Message("Wells Wilson", "Aquest és un missatge de prova."),
      Message("Uxue Esteve", "Hola! Sóc Uxue, encantat de conèixer-te."),
    ];

    return Scaffold( //estructura base de la pantalla.
      appBar: AppBar(title: const Text('Message List')), //barra superior con el título.
      body: ListView.builder( //widget que genera listas dinámicamente (ideal si hay muchos elementos).
        itemCount: messages.length, //número total de mensajes que hay en la lista.
        itemBuilder: (context, index) { //función que construye cada elemento de la lista.
          final msg = messages[index]; //accedemos al mensaje actual según el índice.
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), //espaciado externo alrededor de cada mensaje.
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], //fondo gris claro.
                borderRadius: BorderRadius.circular(15), //bordes redondeados.
              ),
              padding: const EdgeInsets.all(16), //espacio interno dentro del contenedor.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //todo el texto alineado a la izquierda.
                children: [
                  //nombre del autor, en negrita.
                  Text(
                    msg.author,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5), //pequeño espacio entre autor y texto.
                  //mensaje del cuerpo.
                  Text(msg.body),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton( //botón flotante (redondo) abajo a la derecha.
        onPressed: () {}, //sin funcionalidad por ahora.
        child: const Icon(Icons.add), //icono de “+” (para agregar mensajes, por ejemplo).
      ),
    );
  }
}
