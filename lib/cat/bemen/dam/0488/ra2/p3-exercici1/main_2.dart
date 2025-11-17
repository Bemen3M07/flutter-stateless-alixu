import 'package:flutter/material.dart';//Importa la librería “material.dart”, que contiene todos los widgets y estilos del Material Design (el estilo visual de Google).

void main() {//función que se ejecuta primero en toda app Flutter.
  runApp(const MyApp()); //inicia la aplicación y recibe el widget raíz: MyApp.
}//const indica que el widget no cambiará en tiempo de ejecución.

class MyApp extends StatelessWidget { //Definimos un widget personalizado llamado HelloWorldApp. Hereda de StatelessWidget, lo que significa que su contenido no cambia mientras la app está en ejecución (no tiene “estado”).
  const MyApp({super.key}); //el constructor simplemente inicializa la clase y permite que Flutter gestione mejor el widget en memoria.

  @override
  Widget build(BuildContext context) { // Mètode build
    return MaterialApp( // Widget MaterialApp
      title: ' App Ex2', // Títol de l'aplicació
      home: const WelcomePage(), //Establece la pantalla principal (home), en este caso el widget WelcomePage.
    );
  }
}

class WelcomePage extends StatelessWidget {//WelcomePage también es un StatelessWidget, por tanto su contenido es fijo.
  const WelcomePage({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Usa Scaffold como contenedor principal (estructura básica de una pantalla en Material Design).
      body: Center( // Centra el contingut
        child: Column( // Columna para organizar los widgets
          mainAxisAlignment: MainAxisAlignment.center, // Centra los widgets verticalment
          children: [ 
            //Muestra el texto “Welcome!”, grande y en negrita.
            const Text( 
              'Welcome!', 
              style: TextStyle( 
                fontSize: 32, 
                fontWeight: FontWeight.bold, 
              ),
            ),
            //esto es el Texto secundario, color gris y más pequeño.
            const SizedBox(height: 10), // espacio
            const Text(
              'Start learning now', 
              style: TextStyle( 
                fontSize: 20,
                color: Colors.grey, // Color gris subtitulo
              ),
            ),
            //SizedBox se usa para añadir espacios verticales entre widgets
            const SizedBox(height: 40),

            // Botón de Login
            ElevatedButton( 
              onPressed: () {//define la acción al pulsar (vacía de momento).
               
              },
              style: ElevatedButton.styleFrom( // Estilo del botón.
                backgroundColor: Colors.blue, // fondo de color azul
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(20), // bordes redondeados
                ),
                padding: const EdgeInsets.symmetric( // espaciado dentro del boton
                  horizontal: 50, // Padding horitzontal
                  vertical: 15, // Padding vertical
                ),
              ),
              child: const Text( 
                'Login', 
                style: TextStyle(fontSize: 18), // Estilo de texto del boton
              ),
            ),
            const SizedBox(height: 20),

            // Botón de registro:
            ElevatedButton(
              onPressed: () {
                //vacio de momento
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric( // Padding interno
                  horizontal: 50, // Padding horitzontal 
                  vertical: 15, // Padding vertical
                ),
              ),
              child: const Text(  
                'Register',
                style: TextStyle(fontSize: 18), //Estilo de texto del boton
              ),
            ),
          ],
        ),
      ),
    );
  }
}
