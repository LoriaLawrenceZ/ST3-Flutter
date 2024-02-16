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
  TextEditingController _chute = TextEditingController();
  String _resposta = '';
  int numeroRandom = Random().nextInt(100);

  void _verificar() {
    if (int.tryParse(_chute.toString()) == numeroRandom) {
      _resposta = "Acertou!";
    } else if (int.tryParse(_chute.toString())! < numeroRandom) {
      _resposta = "É menor";
    } else {
      _resposta = "É maior!";
    }
  }

  @override
  Widget build(BuildContext context) {
    String chute;
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
              controller: _chute,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Chute um número'),
            ),
            const SizedBox(
              height: 16.0,
              width: 50.0,
            ),
            ElevatedButton(
              onPressed: () => _verificar(),
              child: Text('Chutar'),
            ),
            Text(
              _resposta,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
