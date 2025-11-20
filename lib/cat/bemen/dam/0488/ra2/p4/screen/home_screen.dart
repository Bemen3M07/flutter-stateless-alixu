
import 'package:flutter/material.dart';
import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/pages/page1.dart';
import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/pages/page2.dart';
import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/pages/page3.dart';
import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key, //constructor
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState(); //crear estado
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; //indice de la pagina seleccionada
  final List<Widget> _pages = <Widget>[
    const Page1(), //pagina 1
    const Page2(), //pagina 2
    const Page3(), //pagina 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'), //titulo de la barra
        actions: [ //acciones de la barra
          TextButton(
            onPressed: null, //sin acción
            child: Text(
              context.watch<CounterProvider>().counter.toString(), //muestra el valor de counter
              style: const TextStyle(color: Colors.white), //color del texto
            ),
          )
        ], 
      ), 
      body: _pages[_selectedIndex], //pagina seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //indice de la pagina seleccionada
        onTap: (index) {
          setState(() {
            _selectedIndex = index; //cambiar pagina seleccionada
          });
        },
        //asignacion de label y icono a cada pagina
        items: const [
          BottomNavigationBarItem( //pagina 1
            icon: Icon(Icons.home), //icono de la pagina 1
            label: 'Page 1',
          ),
          BottomNavigationBarItem( //pagina 2
            icon: Icon(Icons.settings), //icono de la pagina 2
            label: 'Page 2',
          ),
          BottomNavigationBarItem( //pagina 3
            icon: Icon(Icons.person), //icono de la pagina 3
            label: 'Page 3',
          ),
        ],
      ), 
    ); 
  }
}
