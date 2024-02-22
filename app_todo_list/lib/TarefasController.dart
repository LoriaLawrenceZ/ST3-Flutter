import 'dart:html';

import 'package:app_todo_list/Tarefas.dart';
import 'package:flutter/material.dart';

class TarefasController extends ChangeNotifier {
  //-----===| ATRIBUTOS |===-----//
  List<Tarefas> _tarefas = []; // Lista de tarefas
  List<Tarefas> get tarefas =>
      _tarefas; // Getter para acessar a lista de tarefas

  //-----===| MÉTODOS |===-----//
  void adicionarTarefa(String descricao) {
    if (descricao.isNotEmpty) {
      _tarefas.add(Tarefas(descricao, false));
      notifyListeners(); // Notifica os ouvintes (widgets) sobre a mudança no estado
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners(); // Notifica os ouvintes (widgets) sobre a mudança no estado
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners(); // Notifica os ouvintes (widgets) sobre a mudança no estado
    }
  }
}
