import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 158, 92, 178),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Color.fromARGB(255, 102, 94, 105),
            ),
            Text(
              taskName,
              style: TextStyle(
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: const Color.fromARGB(255, 48, 12, 9),
              onPressed: () => deleteFunction?.call(context),
              splashRadius: 20.0,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}