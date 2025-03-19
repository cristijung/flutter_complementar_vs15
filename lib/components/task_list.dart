import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<String> tasks;
  final Function(int) onDelete;
  final Function(int, String) onEdit;

  const TaskList({
    Key? key,
    required this.tasks,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.edit),
                  color: Colors.blue,
                  onPressed: () => onEdit(index, tasks[index]),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () => onDelete(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}