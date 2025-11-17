import 'package:flutter/material.dart'; //Importa la librería “material.dart”, que tiene todos los widgets y estilos del Material Design (el estilo visual de Flutter).

void main() { //función principal que se ejecuta primero al iniciar la app.
  runApp(const MyApp()); //inicia la aplicación y recibe el widget raíz: MyApp.
} //el const indica que este widget no cambia durante la ejecución.

class MyApp extends StatelessWidget { //Definimos el widget principal de la app. Hereda de StatelessWidget (sin estado), por tanto su contenido no cambia mientras se ejecuta.
  const MyApp({super.key}); //constructor que inicializa la clase.

  @override
  Widget build(BuildContext context) { //método que construye la interfaz de usuario.
    return MaterialApp( //Widget principal que envuelve toda la app.
      title: ' App Ex3', //Título de la aplicación.
      home: const ResourcePage(), //Define la pantalla principal (home), que será el widget ResourcePage.
    );
  }
}

class ResourcePage extends StatelessWidget { //Clase que representa la pantalla principal. También es un StatelessWidget, así que su contenido no cambia.
  const ResourcePage({super.key}); //constructor

  @override
  Widget build(BuildContext context) { 
    return Scaffold( //estructura base de la pantalla (appbar + contenido principal).
      appBar: AppBar(title: const Text('Resource Example')), //barra superior de la app con el título “Resource Example”.
      body: Padding( //añade espacio (margen interno) alrededor de todo el contenido.
        padding: const EdgeInsets.all(16.0), //16 píxeles de padding por cada lado.
        child: Column( //columna que organiza los widgets verticalmente.
          crossAxisAlignment: CrossAxisAlignment.start, //todo el contenido alineado a la izquierda.
          children: [
            Column( //columna interna que agrupa el texto y la imagen.
              mainAxisSize: MainAxisSize.min, //la columna ocupa solo el espacio necesario (no toda la pantalla).
              crossAxisAlignment: CrossAxisAlignment.start, //alineamos texto e imagen a la izquierda también.
              children: [
                //muestra un texto simple con estilo.
                const Text(
                  'This is a resource string',
                  style: TextStyle(fontSize: 18), //tamaño de letra 18.
                ),
                const SizedBox(height: 10), //espacio vertical entre el texto y la imagen.
                
                //imagen cargada desde una URL.
                Align(
                  alignment: Alignment.centerLeft, //la imagen se coloca alineada a la izquierda.
                  child: Image.network(
                    'https://i.imgur.com/8Km9tLL.jpg', //URL de la imagen que se muestra.
                    width: 150, //ancho de la imagen en píxeles.
                    height: 150, //alto de la imagen en píxeles.
                    fit: BoxFit.cover, //ajusta la imagen para cubrir el espacio sin deformarse.
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
