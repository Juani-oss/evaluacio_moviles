import 'package:flutter/material.dart';
import 'main.dart' as main;
import 'pagina2.dart' as p2;
import 'pagina3.dart' as p3;
import 'pagina4.dart' as p4;


class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}
class _CuerpoState extends State<Cuerpo> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final pantallas = [
      main.Cuerpo(),
      p2.Cuerpo(),
      p3.Cuerpo(),
      p4.Cuerpo()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("EVALUACION"),
      ),
      body: pantallas[_tab],
      bottomNavigationBar: bottomTab(_tab, (i) => setState(() => _tab = i)),
    );
  }
}



Widget bottomTab(int tab, Function(int) onTap) {
  return BottomNavigationBar(
    currentIndex: tab,
    onTap: onTap,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Pagina 1'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Pagina 2'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Pagina 3'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Pagina 4'),
    ],
  );
}
