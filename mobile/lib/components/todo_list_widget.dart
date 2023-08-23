import 'package:flutter/material.dart';
import 'package:mobile/todo/model/todo.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    super.key,
    required this.todo,
    required this.onTap,
  });

  final TodoModel todo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(todo.name), Text(todo.description)],
        ),
      ),
    );
  }
}
