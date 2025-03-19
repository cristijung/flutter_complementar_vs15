import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefas'),
      ),
      body: const Center(
        child: Text('Tela inicial de tarefas'),
      ),
    );
  }
}
