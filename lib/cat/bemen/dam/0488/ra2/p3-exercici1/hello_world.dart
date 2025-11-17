import 'package:flutter/material.dart';//Importa la librería “material.dart”, que contiene todos los widgets y estilos del Material Design (el estilo visual de Google).

void main() {//main() es la función que se ejecuta primero en toda app Flutter.
  runApp(const HelloWorldApp());// lanza la aplicación, recibiendo como parámetro el widget raíz, en este caso HelloWorldApp.
}//El prefijo const indica que este widget no cambiará su estado (es inmutable).

class HelloWorldApp extends StatelessWidget { //Definimos un widget personalizado llamado HelloWorldApp. Hereda de StatelessWidget, lo que significa que su contenido no cambia mientras la app está en ejecución (no tiene “estado”).
  const HelloWorldApp({super.key});//el constructor simplemente inicializa la clase y permite que Flutter gestione mejor el widget en memoria.

  @override
  Widget build(BuildContext context) { //buid es un metodo obligatorio en todos los widgets y devuelve la interfaz visual (UI) del widget. Cada vez que Flutter necesita “dibujar” este widget en pantalla, ejecuta este método.
    return MaterialApp( //materialApp es el contenedor principal de cualquier app basada en Material Design.
      debugShowCheckedModeBanner: false, //oculta la cinta roja que dice “Debug” en la esquina superior derecha.
      home: Scaffold( //define la pantalla principal de la app, y dentro tiene un widget Scaffold. Scaffold proporciona una estructura básica para la pantalla, incluyendo una barra de aplicación (appBar) y un cuerpo (body).
        appBar: AppBar( //crea la barra superior con título y color.
          title: const Text('Exercici 1.1 - Hello World'), //Definimos el titulo de la app
          backgroundColor: Colors.deepPurple, //color de la barra de la app
        ),
        body: const Center(  //señalamos que queremos que se muestre en el cuerpo de la app un widget Center, que centra su contenido tanto vertical como horizontalmente.
          child: Text( 
            'Hello World!', 
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), //muestra el texto con un estilo (tamaño 28, negrita).
          ), 
        ),
      ),
    );
  }
}
