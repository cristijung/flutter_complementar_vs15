import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  final String initialTask;
  final Function(String) onSave;

  const EditTask({Key? key, required this.initialTask, required this.onSave}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _taskController.text = widget.initialTask;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar Tarefa'),
      content: TextField(
        controller: _taskController,
        decoration: const InputDecoration(labelText: 'Tarefa'),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('Salvar'),
          onPressed: () {
            widget.onSave(_taskController.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}