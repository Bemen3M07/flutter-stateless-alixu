
import 'package:flutter/material.dart';//Importa la librería “material.dart”, que contiene todos los widgets y estilos del Material Design (el estilo visual de Google)

void main() {
  runApp(const GoodMorningApp()); //Función principal que inicia la aplicación llamando a runApp con el widget raíz GoodMorningApp
}
class GoodMorningApp extends StatefulWidget { 
  const GoodMorningApp({super.key}); //Define un widget con estado llamado GoodMorningApp
  @override
  State<GoodMorningApp> createState() => _GoodMorningAppState(); //Crea el estado asociado al widget GoodMorningApp
}
class _GoodMorningAppState extends State<GoodMorningApp> { //Define la clase de estado para GoodMorningApp
  String greeting = "Good ?!"; //Variable de estado que almacena el saludo actual
  void sayMorning() {
    setState(() { //Función que actualiza el estado para mostrar el saludo de la mañana
      greeting = "Good Morning!";  //Actualiza el saludo a "Good Morning!"
    });
  }
  void sayNight() {
    setState(() {
      greeting = "Good Night!"; //Actualiza el saludo a "Good Night!"
    });
  }
  @override
  Widget build(BuildContext context) { //Método build que construye la interfaz de usuario
    return MaterialApp( //Widget raíz de la aplicación que utiliza Material Design
      title: 'Good Morning App', //Título de la aplicación
      home: Scaffold( //Scaffold proporciona una estructura básica para la aplicación
        appBar: AppBar( //Barra de la aplicación en la parte superior
          title: const Text("Exercise 2.1 - Good Morning"), //Título en la barra de la aplicación
        ),
        body: Center( //Centrar el contenido en el cuerpo de la aplicación
          child: Column(  //Organizar los widgets en una columna
            mainAxisAlignment: MainAxisAlignment.center,  //Centrar los widgets verticalmente 
            children: [
              Text(
                greeting, //Muestra el saludo actual
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold), //Estilo del texto del saludo
              ),
              const SizedBox(height: 30), //Espacio vertical entre el saludo y los botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Centrar los botones horizontalmente
                children: [
                  ElevatedButton( //Botón para el saludo de la mañana
                    onPressed: sayMorning, //Acción al presionar el botón de la mañana
                    child: const Text("Morning"), //Texto del botón
                  ),
                  const SizedBox(width: 20), //Espacio horizontal entre los botones
                  ElevatedButton(
                    onPressed: sayNight,  //Acción al presionar el botón de la noche
                    child: const Text("Night"), //Botón para el saludo de la noche
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
