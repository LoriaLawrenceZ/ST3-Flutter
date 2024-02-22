import 'package:app_todo_list/TarefasController.dart';
import 'package:app_todo_list/TarefasView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a Tarefa
      home: ChangeNotifierProvider(
        create: (context) => TarefasController(),
        child: TarefasView(),
      ),
    );
  }
}
