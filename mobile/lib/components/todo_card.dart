import 'package:flutter/material.dart';

import '../todo/model/todo.dart';
import '../todo/view_models/todo_view_model.dart';
import '../utils/constants.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todo,
    required this.todoModelView,
  });

  final TodoModel todo;
  final TodoModelView todoModelView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Colors.blue,
            ),
            height: getHeight(context) * 0.1,
            width: getWidth(context) * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                todo.name,
                style: TextStyle(
                    decoration:
                        todo.status ? TextDecoration.lineThrough : null),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 300,
                ),
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  todo.description,
                  style: TextStyle(
                      decoration:
                          todo.status ? TextDecoration.lineThrough : null),
                ),
              ),
              SizedBox(
                height: getHeight(context) * 0.02,
              ),
              Text(todo.createdAt)
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  todoModelView.setChecked(todo.id);
                },
                child: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: todo.status ? Colors.blue : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: todo.status ? Colors.blue : Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    child: todo.status
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16.0,
                          )
                        : null),
              ),
              IconButton(
                  onPressed: () {
                    todoModelView.deleteTodo(todo);
                  },
                  icon: Icon(Icons.cancel))
            ],
          ),
        ],
      ),
    );
  }
}
