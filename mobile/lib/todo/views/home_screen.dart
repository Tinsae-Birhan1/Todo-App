import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/components/todo_list_widget.dart';
import 'package:mobile/todo/model/todo.dart';
import 'package:mobile/todo/view_models/todo_view_model.dart';
import 'package:mobile/todo/views/todo_add.dart';
import 'package:mobile/utils/constants.dart';

import 'package:provider/provider.dart';

import '../../components/loading_widget.dart';
import '../../components/todo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoModelView todoModelView = context.watch<TodoModelView>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Hello Tinsae',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Todays Task',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TodoForm()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 7, 97, 170)),
                    height: getHeight(context) * 0.035,
                    width: getWidth(context) * 0.25,
                    child: Center(
                      child: Text(
                        '+ New Task',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            _ui(todoModelView)
          ],
        ),
      ),
    );
  }

  _ui(TodoModelView todoModelView) {
    if (todoModelView.loading) {
      return const LoadingWidget();
    } else if (todoModelView.todoError != '') {
      return Center(child: Text('${todoModelView.todoError}'));
    }
    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              TodoModel todo = todoModelView.todoList[index];
              return TodoCard(
                todo: todo,
                todoModelView: todoModelView,
              );
            },
            itemCount: todoModelView.todoList.length));
  }
}
