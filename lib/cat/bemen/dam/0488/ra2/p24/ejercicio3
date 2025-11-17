import 'dart:math';     
import 'package:flutter/material.dart';//Importa la librería “material.dart”, que contiene todos los widgets y estilos del Material Design (el estilo visual de Google)


void main() {
  runApp(SecretNumberApp()); //Función principal que inicia la aplicación llamando a runApp con el widget raíz SecretNumberApp
}
class SecretNumberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { //Método build que construye la interfaz de usuario
    return MaterialApp(
      title: 'Exercici 2.3 Secret number', //Título de la aplicación
      home: SecretNumberPage(), //Página principal de la aplicación
      debugShowCheckedModeBanner: false, //Elimina la etiqueta de depuración
    );
  }
}
class SecretNumberPage extends StatefulWidget { 
  @override 
  _SecretNumberPageState createState() => _SecretNumberPageState(); //Crea el estado asociado al widget SecretNumberPage
}
class _SecretNumberPageState extends State<SecretNumberPage> { //Define la clase de estado para SecretNumberPage
  final TextEditingController _controller = TextEditingController(); //Controlador para el campo de texto
  late int _numeroSecret; //Número secreto que el usuario debe adivinar
  int _intents = 0; //Número de intentos realizados por el usuario
  String _missatge = ''; //Mensaje que se muestra al usuario
  @override
  void initState() {
    super.initState(); 
    _generarNumeroSecret(); //Genera el número secreto al iniciar el estado
  }
  void _generarNumeroSecret() {
    final random = Random(); //Genera un número aleatorio
    _numeroSecret = random.nextInt(101); // entre 0 y 100
    _intents = 0; // Reinicia el contador de intentos
    _missatge = ''; // Reinicia el mensaje
    _controller.clear(); // Limpia el campo de texto
  }
  void _comprovarNumero() {
    setState(() {
      if (_controller.text.isEmpty) {
        _missatge = 'Introdueix un número!'; // Mensaje cuando el campo está vacío
        return;}
      final int? numeroUsuari = int.tryParse(_controller.text); // Intenta convertir el texto a un número entero
      if (numeroUsuari == null) { // Si la conversión falla, muestra un mensaje de error
        _missatge = 'Si us plau, introdueix un número vàlid.'; // Mensaje de error para entrada no válida
        return;
      }
      _intents++; // Incrementa el contador de intentos
      if (numeroUsuari < _numeroSecret) {
        _missatge = 'El número que busques és més gran'; // Mensaje si el número es menor que el secreto
      } else if (numeroUsuari > _numeroSecret) { // Mensaje si el número es mayor que el secreto
        _missatge = 'El número que busques és més petit'; // Mensaje si el número es mayor que el secreto
      } else {
        _missatge = 'Has encertat!'; // Mensaje si el usuario acierta el número
      }
    });
  }
  @override
  Widget build(BuildContext context) { //Método build que construye la interfaz de usuario
    return Scaffold(
      appBar: AppBar(title: Text('Endevina el número secret')), //Barra de la aplicación en la parte superior
      body: Padding(
        padding: const EdgeInsets.all(20.0), //Padding de 20 píxeles en todos los lados
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //Centrar los widgets verticalmente
          children: [
            TextField(
              controller: _controller, //Controlador para el campo de texto
              keyboardType: TextInputType.number, //Tipo de teclado numérico
              decoration: InputDecoration(
                labelText: 'Introdueix un número', //Etiqueta del campo de texto
                border: OutlineInputBorder(), //Borde del campo de texto
              ),
            ),
            SizedBox(height: 20), //Espacio vertical entre el campo de texto y el botón
            ElevatedButton(
              onPressed: _comprovarNumero, //Acción al presionar el botón
              child: Text('Validar'), //Texto del botón
            ),
            SizedBox(height: 20), //Espacio vertical entre el botón y el mensaje
            Text('Intents: $_intents'), //Muestra el número de intentos realizados
            SizedBox(height: 10), //Espacio vertical entre el contador de intentos y el mensaje
            Text(
              _missatge,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),  //Estilo del texto del mensaje
            ),
          ],
        ),
      ),
    );
  }
}
