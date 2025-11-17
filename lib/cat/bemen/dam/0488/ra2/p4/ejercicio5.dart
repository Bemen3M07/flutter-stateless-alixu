import 'package:flutter/material.dart';//Importa la librería “material.dart”, que contiene todos los widgets y estilos del Material Design (el estilo visual de Google)


void main() {
  runApp(const ejercicio5()); //Función principal que inicia la aplicación llamando a runApp con el widget raíz SecretNumberApp
}

class ejercicio5 extends StatefulWidget {
  const ejercicio5({super.key}); //Crea el estado asociado al widget SecretNumberPage

  @override
  State<ejercicio5> createState() => _ejercicio5State(); //Crea el estado asociado al widget SecretNumberPage
}

class _ejercicio5State extends State<ejercicio5> {
  int local = 0; //Puntuación del equipo local
  int visitante = 0; //Puntuación del equipo visitante

  void reset() {
    setState(() { 
      local = 0; //Resetea la puntuación del equipo local a 0
      visitante = 0; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Elimina la etiqueta de depuración
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ejercicio5 – Marcador"), //Título de la aplicación
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,  //Centra los elementos verticalmente
          children: [
    
            const Text(
              "Local",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),   //Texto "Local" con estilo
            ),
            Text(
              "$local",
              style: const TextStyle(fontSize: 60),  //Muestra la puntuación del equipo local con estilo
            ),
            ElevatedButton(
              onPressed: () { 
                setState(() { 
                  local++;
                });
              },
              child: const Text("+1 Local"), //Botón para incrementar la puntuación del equipo local
            ),

            const SizedBox(height: 40), //Espacio entre los dos equipos

 
            const Text(
              "Visitante",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),   //Texto "Visitante" con estilo
            ),
            Text(
              "$visitante", 
              style: const TextStyle(fontSize: 60),  //Muestra la puntuación del equipo visitante con estilo
            ),
            ElevatedButton(
              onPressed: () { 
                setState(() { 
                  visitante++;
                });
              },
              child: const Text("+1 Visitante"), //Botón para incrementar la puntuación del equipo visitante
            ),

            const SizedBox(height: 50), //Espacio antes del botón de reset

            ElevatedButton(
              onPressed: reset, //Botón para resetear las puntuaciones
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red), //Estilo del botón de reset con color de fondo rojo
              child: const Text("Reset"), //Texto del botón de reset
            ),
          ],
        ),
      ),
    );
  }
}
