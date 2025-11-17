import 'package:flutter/material.dart';//Importa la librería “material.dart”, que contiene todos los widgets y estilos del Material Design (el estilo visual de Google)

void main() {
  runApp(SayHelloApp()); //Función principal que inicia la aplicación llamando a runApp con el widget raíz SayHelloApp
}
class SayHelloApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) { //Método build que construye la interfaz de usuario
    return MaterialApp( //Widget raíz de la aplicación que utiliza Material Design
      title: 'Exercici 2.2 Say Hello', //Título de la aplicación
      home: SayHelloPage(), //Página principal de la aplicación
      debugShowCheckedModeBanner: false, //Elimina la etiqueta de depuración
    );
  }
}
class SayHelloPage extends StatefulWidget { 
  @override
  _SayHelloPageState createState() => _SayHelloPageState(); //Crea el estado asociado al widget SayHelloPage
}
class _SayHelloPageState extends State<SayHelloPage> {  //Define la clase de estado para SayHelloPage
  final TextEditingController _nameController = TextEditingController(); //Controlador para el campo de texto
  String _message = ''; //Variable de estado que almacena el mensaje a mostrar
  void _sayHello() {
    String name = _nameController.text.trim(); //Obtiene el nombre introducido por el usuario
    if (name.isEmpty) { //Si el nombre está vacío, muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar( 
        SnackBar(content: Text('Introdueix el teu nom')), //Mensaje de error si el campo está vacío
      );
      return;
    }
    setState(() {
      _message = 'HELLO $name'; //Actualiza el mensaje para mostrar el saludo
    });
    showDialog(
      context: context, //Contexto para mostrar el diálogo
      builder: (context) => AlertDialog( //Diálogo de alerta que muestra el saludo
        title: Text('Benvingut/da!'), //Título del diálogo
        content: Text('Hola $name'), //Contenido del diálogo con el saludo
        actions: [ //Acciones del diálogo
          TextButton(
            onPressed: () => Navigator.pop(context), //Cierra el diálogo al presionar el botón
            child: Text('Tancar'), //Texto del botón para cerrar el diálogo
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) { //Método build que construye la interfaz de usuario
    return Scaffold(
      backgroundColor: Colors.white, //Color de fondo de la aplicación
      body: Center( //Centrar el contenido en el cuerpo de la aplicación
        child: Padding( //Añade un padding alrededor del contenido
          padding: const EdgeInsets.all(24.0), //Padding de 24 píxeles en todos los lados
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Centrar los widgets verticalmente
            children: [
              TextField(
                controller: _nameController, //Controlador para el campo de texto
                decoration: InputDecoration( //Decoración del campo de texto
                  labelText: 'Name', //Etiqueta del campo de texto
                  hintText: 'hola', //Texto de sugerencia dentro del campo
                  filled: true, //Indica que el campo está relleno
                  fillColor: Colors.grey[300], //Color de fondo del campo de texto
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), //Bordes redondeados para el campo de texto
                  ),
                ),
              ),
              const SizedBox(height: 20), //Espacio vertical entre el campo de texto y el botón
              ElevatedButton(
                onPressed: _sayHello, //Acción al presionar el botón
                style: ElevatedButton.styleFrom( 
                  backgroundColor: Colors.blueGrey[900], //Color de fondo del botón
                  foregroundColor: Colors.white, //Color del texto del botón
                  shape: StadiumBorder(), //Bordes redondeados para el botón
                  padding: const EdgeInsets.symmetric( 
                    horizontal: 30, //Padding horizontal del botón
                    vertical: 12,
                  ),
                  overlayColor: Colors.transparent, // Elimina tono gris
                ),
                child: const Text('SayHello'), //Texto del botón
              ),
              const SizedBox(height: 40), //Espacio vertical entre el botón y el mensaje
              if (_message.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric( 
                    horizontal: 30, //Padding horizontal del contenedor del mensaje
                    vertical: 20, //Padding vertical del contenedor del mensaje
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200], //Color de fondo del contenedor del mensaje
                    borderRadius: BorderRadius.circular(20), //Bordes redondeados para el contenedor del mensaje
                  ),
                  child: Text(
                    _message,
                    style: const TextStyle(
                      fontSize: 20,   //Tamaño de fuente del mensaje
                      fontWeight: FontWeight.bold, //Peso de fuente en negrita
                      color: Colors.black87, //Color del texto del mensaje
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
