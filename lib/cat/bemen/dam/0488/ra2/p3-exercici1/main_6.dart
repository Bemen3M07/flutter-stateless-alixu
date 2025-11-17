import 'package:flutter/material.dart'; //Importa la librería principal del framework Flutter (con widgets del Material Design).

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
    return MaterialApp( //estructura general de la app.
      title: 'Lista Ex6', //título de la aplicación.
      home: const MessageListPage(), //pantalla principal (MessageListPage).
    );
  }
}

class MessageListPage extends StatelessWidget { //clase que representa la pantalla de lista de mensajes.
  const MessageListPage({super.key}); //constructor.

  @override
  Widget build(BuildContext context) {
    //Creamos una lista con 4 mensajes de ejemplo (autor + texto).
    final messages = [
      Message("Emma Atkins", "Hola! Aquest és el meu primer missatge."),
      Message("Karter Kramer", "Bon dia! Com va tot?"),
      Message("Wells Wilson", "Aquest és un missatge de prova."),
      Message("Uxue Esteve", "Hola! Sóc Uxue, encantat de conèixer-te."),
    ];

    return Scaffold( //estructura base de la pantalla.
      appBar: AppBar(title: const Text('Message List')), //barra superior con el título.
      body: ListView.builder( //widget que genera la lista de forma dinámica según el número de mensajes.
        itemCount: messages.length, //cuenta cuántos mensajes hay.
        itemBuilder: (context, index) { //construye cada elemento de la lista.
          final msg = messages[index]; //accede al mensaje actual.
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), //espaciado externo alrededor de cada mensaje.
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200], //fondo gris claro.
                borderRadius: BorderRadius.circular(15), //bordes redondeados.
              ),
              padding: const EdgeInsets.all(16), //espacio interno dentro del contenedor.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //alineación del texto a la izquierda.
                children: [
                  //nombre del autor (negrita y más grande).
                  Text(
                    msg.author,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5), //espacio entre autor y mensaje.
                  Text(msg.body), //contenido del mensaje.
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton( //botón flotante (círculo con +).
        onPressed: () {}, //sin funcionalidad todavía.
        child: const Icon(Icons.add), //icono de “+” (añadir mensaje).
      ),
      //Barra de navegación inferior.
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message), //icono de mensajes.
            label: 'Messages', //etiqueta del primer botón.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts), //icono de contactos.
            label: 'Contacts', //etiqueta del segundo botón.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings), //icono de configuración.
            label: 'Settings', //etiqueta del tercer botón.
          ),
        ],
        currentIndex: 0, //indica qué elemento está seleccionado (el primero por defecto).
        onTap: (index) {}, //acción al tocar un botón (vacía por ahora).
      ),
    );
  }
}
