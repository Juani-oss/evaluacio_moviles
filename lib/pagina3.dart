import 'package:flutter/material.dart';


class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 3')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            inputVelocidadInicial(),
            SizedBox(height: 16),
            inputVelocidadFinal(),
            SizedBox(height: 16),
            inputTiempo(),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () => calcularAceleracion(context), child: Text('Calcular')),
          ],
        ),
      ),
    );
  }
}





TextEditingController vi = TextEditingController();
Widget inputVelocidadInicial() {
  return TextField(
    controller: vi,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      label: Text('Velocidad inicial (m/s)'),
    ),
  );
}



TextEditingController vf = TextEditingController();
Widget inputVelocidadFinal() {
  return TextField(
    controller: vf,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      label: Text('Velocidad final (m/s)'),
    ),
  );
}

TextEditingController t = TextEditingController();
Widget inputTiempo() {
  return TextField(
    controller: t,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      label: Text('Tiempo (s)'),
    ),
  );
}

void calcularAceleracion(BuildContext context) {
  final velInicial = double.parse(vi.text);
  final velFinal = double.parse(vf.text);
  final tiempo = double.parse(t.text);

  final a = (velFinal - velInicial) / tiempo;
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Resultado'),
      content: Text('a = ${a.toStringAsFixed(2)} m/s²'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
      ],
    ),
  );
}


