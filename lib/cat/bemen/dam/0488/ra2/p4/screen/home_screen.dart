
import 'package:flutter/material.dart';
import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/pages/page1.dart';
import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/pages/page2.dart';
import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/pages/page3.dart';
import 'package:flutter_stateless_alixu/cat/bemen/dam/0488/ra2/p4/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  //lista de las 3 pages
  final List<Widget> _pages = <Widget>[
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //barra inferior con menu de pages
        title: const Text('Material App Bar'),
        actions: [
          TextButton(
            onPressed: null,
            child: Text(
              context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          )
        ], // Text // TextButton
      ), // AppBar
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        //asignacion de label y icono a cada pagina
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page 3',
          ),
        ],
      ), // Center
    ); // Scaffold
  }
}
