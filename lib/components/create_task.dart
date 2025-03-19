import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  final Function(String) addTask;

  const CreateTask({Key? key, required this.addTask}) : super(key: key);

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Crie suas Tarefas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _taskController,
                  decoration: const InputDecoration(labelText: 'Nova Tarefa'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, size: 30, color: Colors.deepPurple),
                onPressed: () {
                  if (_taskController.text.isNotEmpty) {
                    widget.addTask(_taskController.text);
                    _taskController.clear();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}