import 'package:flutter/material.dart';
import '../components/create_task.dart';
import '../components/task_list.dart';
import '../components/edit_task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void editTask(int index, String newTask) {
    setState(() {
      tasks[index] = newTask;
    });
  }

  void _showEditDialog(int index, String initialTask) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditTask(
          initialTask: initialTask,
          onSave: (newTask) {
            editTask(index, newTask);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gerenciador de Tarefas',
          style: TextStyle(color: Colors.white), // Texto branco
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body:Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Aqui você poderá gerenciar suas tarefas',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CreateTask(addTask: addTask),
          TaskList(
            tasks: tasks,
            onDelete: deleteTask,
            onEdit: _showEditDialog,
          ),
        ],
      ),
    );
  }
}

