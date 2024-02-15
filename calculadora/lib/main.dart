import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();
  String _resultado = '';

  void _calcular(String operacao) {
    double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
    double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
    double resultado;

    setState(() {
      switch (operacao) {
        case 'Somar':
          resultado = numero1 + numero2;
          break;
        case 'Subtrair':
          resultado = numero1 - numero2;
          break;
        case 'Multiplicar':
          resultado = numero1 * numero2;
          break;
        case 'Dividir':
          resultado = (numero2 != 0 ? numero1 / numero2 : null)!;
          break;
        case 'Potencia':
          resultado = pow(numero1, numero2) as double;
          break;
        default:
          resultado = 0.0;
      }

      _resultado =
          resultado != null ? 'Resultado: $resultado' : 'Erro na operação';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 1'),
            ),
            const SizedBox(
              height: 16.0,
              width: 100.0,
            ),
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Número 2'),
            ),
            const SizedBox(
              height: 16.0,
              width: 50.0,
            ),
            ElevatedButton(
              onPressed: () => _calcular('Somar'),
              child: Text('Somar'),
            ),
            FilledButton(
                onPressed: () => _calcular("Subtrair"),
                child: Text("Subtrair")),
            CupertinoButton(
                onPressed: () => _calcular("Multiplicar"),
                child: Text("Multiplicar")),
            FilledButton(
                onPressed: () => _calcular("Dividir"),
                child: const Text("Dividir")),
            const SizedBox(height: 16.0),
            Text(
              _resultado,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Foda em irmão",
              style: TextStyle(
                  color: Color.fromARGB(189, 255, 0, 0),
                  backgroundColor: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
