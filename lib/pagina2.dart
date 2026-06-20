import 'package:flutter/material.dart';

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicio 2')),
      body: Imagen(
        child: Column(
          children: [
            inputSistolica(),
            SizedBox(height: 16),
            inputDiastolica(),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () => calcularPAM(context), child: Text('Calcular')),
          ],
        ),
      ),
    );
  }
}

class Imagen extends StatelessWidget {
  final Widget child;
  const Imagen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(24),
      child: child,
    );
  }
}

TextEditingController sistolica = TextEditingController();
Widget inputSistolica() {
  return TextField(
    controller: sistolica,
    
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      label: Text('Presión Sistólica (mmHg)'),
    ),
  );
}


TextEditingController diastolica = TextEditingController();
Widget inputDiastolica() {
  return TextField(
    controller: diastolica,
    
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      label: Text('Presión Diastólica (mmHg)'),
    ),
  );
}

void calcularPAM(BuildContext context) {
  final s = double.parse(sistolica.text);
  final d = double.parse(diastolica.text);
  final pam = (d + (s - d) / 3).toStringAsFixed(2);

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Resultado'),
      content: Text('PAM = $pam mmHg'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
      ],
    ),
  );
}

