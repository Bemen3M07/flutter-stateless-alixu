import 'package:flutter/material.dart'; //Importa la librería principal de Flutter con todos los widgets del Material Design.

void main() { //Función principal que se ejecuta al iniciar la app.
  runApp(const MyApp()); //Inicia la aplicación y muestra el widget raíz: MyApp.
}

//Clase Contact → representa un contacto con nombre, email y teléfono.
class Contact {
  final String fullName; //nombre completo.
  final String email; //correo electrónico.
  final String phone; //número de teléfono.

  //constructor de la clase Contact, con los tres parámetros obligatorios.
  Contact({required this.fullName, required this.email, required this.phone});
}

class MyApp extends StatelessWidget { //Widget principal de la app (sin estado).
  const MyApp({super.key}); //constructor.

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //Contenedor principal de la app.
      title: ' App Ex4', //Título de la aplicación.
      home: const ContactPage(), //Pantalla principal (el widget ContactPage).
    );
  }
}

class ContactPage extends StatelessWidget { //Clase que representa la pantalla del contacto.
  const ContactPage({super.key}); //constructor.

  @override
  Widget build(BuildContext context) { 
    //Creamos un objeto Contact con datos de ejemplo.
    final contact = Contact(
      fullName: 'Marta Casserres',
      email: 'marta@gmail.com',
      phone: '934748474',
    );

    return Scaffold( //estructura base de la pantalla.
      appBar: AppBar(title: const Text('Contact')), //barra superior con el título “Contact”.
      body: Center( //centra el contenido en la pantalla.
        child: Column( //organiza los widgets verticalmente.
          mainAxisAlignment: MainAxisAlignment.center, //centra todo verticalmente.
          children: [
            //Imagen de perfil circular.
            CircleAvatar(
              radius: 50, //tamaño del círculo.
              backgroundImage: NetworkImage(
                  'https://i.imgur.com/8Km9tLL.jpg'), //imagen cargada desde internet.
            ),
            const SizedBox(height: 15), //espacio entre la imagen y el nombre.

            //Nombre de la persona.
            Text(
              contact.fullName, //usa el nombre del objeto contact.
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, //letra grande y en negrita.
              ),
            ),
            const SizedBox(height: 20), //espacio entre el nombre y la caja gris.

            //Contenedor gris con la info de contacto (email y teléfono).
            Container(
              padding: const EdgeInsets.all(16), //espaciado interno.
              decoration: BoxDecoration(
                color: Colors.grey[200], //color de fondo gris claro.
                borderRadius: BorderRadius.circular(20), //bordes redondeados.
              ),
              child: Column(
                children: [
                  //Fila del correo con emoji de Gmail.
                  Row(
                    mainAxisSize: MainAxisSize.min, //ajusta el ancho al contenido.
                    children: [
                      const Text('📧', style: TextStyle(fontSize: 20)), //emoji.
                      const SizedBox(width: 10), //espacio entre emoji y texto.
                      Text(
                        contact.email, //muestra el email del contacto.
                        style: const TextStyle(fontSize: 18), //tamaño de texto.
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), //espacio entre email y teléfono.

                  //Fila del teléfono con emoji de teléfono.
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('📞', style: TextStyle(fontSize: 20)), //emoji teléfono.
                      const SizedBox(width: 10),
                      Text(
                        contact.phone, //muestra el número del contacto.
                        style: const TextStyle(fontSize: 18), //tamaño de texto.
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
