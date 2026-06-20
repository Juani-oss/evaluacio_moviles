import 'package:flutter/material.dart';
import 'navigatos.dart' as nav;

void main(){
  runApp(const evaluacion());
}

class evaluacion extends StatelessWidget {
  const evaluacion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: nav.Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Informacion"),),
      body: ElevatedButton(onPressed: ()=>verInfor(context), child: Text("Ver info"))
    );
  }
}

void verInfor(BuildContext context) {
  showDialog(context: context, builder: (context) =>
  AlertDialog(
    title: Text("titulo: EJERCICIOS DE PROGRAMACION"),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Programador: Juan Romero"),
        Text("Carrera: Desarrollo de Software"),
      ],
    ),
  ));
}
