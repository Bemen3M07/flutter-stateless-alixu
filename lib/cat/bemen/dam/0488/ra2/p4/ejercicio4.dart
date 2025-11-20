import 'package:flutter/material.dart'; //importar material.dart
import 'dart:math'; //importar dart:math para generar números aleatorios



class Ejercicio4 extends StatefulWidget { 
  const Ejercicio4({super.key}); //constructor

  @override
  State<Ejercicio4> createState() => _Ejercicio4State(); //crear estado
}

class _Ejercicio4State extends State<Ejercicio4> {
  int _dado1 = 1; //valor inicial del dado 1
  int _dado2 = 1; //valor inicial del dado 2
  final Random _random = Random();  //crear instancia de Random para generar números aleatorios

  void _rollDice() {
    setState(() { 
      _dado1 = _random.nextInt(6) + 1;  //generar número aleatorio entre 1 y 6 para dado 1
      _dado2 = _random.nextInt(6) + 1;  //generar número aleatorio entre 1 y 6 para dado 2
    });

    if (_dado1 == 6 && _dado2 == 6) {  //si ambos dados son 6, mostrar mensaje de jackpot
      _showJackpotToast();  //llamar a función para mostrar mensaje
    }
  }

  void _showJackpotToast() {
    ScaffoldMessenger.of(context).showSnackBar( //show snackbar
      const SnackBar( 
        content: Text( 
          'JACKPOT!', 
          style: TextStyle( 
            fontSize: 20, //tamaño de fuente
            fontWeight: FontWeight.bold, //negrita
          ),
          textAlign: TextAlign.center, //centrar texto
        ),
        duration: Duration(seconds: 2), //duración del mensaje
        backgroundColor: Colors.green, //color de fondo
      ),
    );
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold( 
      body: Container(
        decoration: const BoxDecoration( //decoración del contenedor
          gradient: LinearGradient( 
            begin: Alignment.topCenter, //degradado de arriba a abajo
            end: Alignment.bottomCenter, //degradado de arriba a abajo
            colors: [
              Color(0xFF1B5E5E), //color superior
              Color(0xFF0D3D3D), //color inferior
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: const Color(0xFF0D3D3D), //color de fondo del título
                child: const Center(
                  child: Text( 
                    'Gambling', 
                    style: TextStyle(
                      color: Color(0xFFE74C3C), //color del texto
                      fontSize: 48, //tamaño de fuente
                      fontWeight: FontWeight.bold, //negrita
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, //centrar contenido verticalmente
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20), //margen horizontal
                    padding: const EdgeInsets.all(20), //padding
                    decoration: BoxDecoration(
                      color: const Color(0xFF5C6B7C), //color de fondo del contenedor de dados
                      borderRadius: BorderRadius.circular(10), //borde redondeado
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Roll the dice',
                          style: TextStyle(
                            color: Colors.white, //color del texto
                            fontSize: 18, //tamaño de fuente
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, //centrar dados horizontalmente
                          children: [
                            _buildDice(_dado1), //construir dado 1
                            const SizedBox(width: 20), //espacio entre dados
                            _buildDice(_dado2), //construir dado 2
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30), //espacio entre contenedor de dados y botón
                  ElevatedButton(
                    onPressed: _rollDice, //llamar a función para tirar los dados
                    style: ElevatedButton.styleFrom( 
                      backgroundColor: const Color(0xFF5C6B7C), //color de fondo del botón
                      padding: const EdgeInsets.symmetric( 
                        horizontal: 50, //padding horizontal
                        vertical: 15, //padding vertical
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), //borde redondeado
                      ),
                    ),
                    child: const Text(
                      'ROLL THE DICE',
                      style: TextStyle( 
                        color: Colors.white, //color del texto
                        fontSize: 16, //tamaño de fuente
                        fontWeight: FontWeight.bold, //negrita
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDice(int value) {
    return Image.asset(
      'assets/dice/dice_$value.png',  // CORRECTO
      width: 100, //ancho del dado
      height: 100, //alto del dado
      errorBuilder: (context, error, stackTrace) => Container( //si no se encuentra la imagen, mostrar contenedor con número
        width: 100, //ancho del dado
        height: 100, //alto del dado
        decoration: BoxDecoration(
          color: Colors.grey[800], //color de fondo del contenedor de dado
          borderRadius: BorderRadius.circular(10), //borde redondeado
        ),
        child: Center(
          child: Text( 
            '$value', //mostrar valor del dado
            style: const TextStyle( 
              fontSize: 40, //tamaño de fuente
              color: Colors.white, //color del texto
              fontWeight: FontWeight.bold, //negrita
            ),
          ),
        ),
      ),
    );
  }
}
