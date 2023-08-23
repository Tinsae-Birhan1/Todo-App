import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/todo/model/todo.dart';
import 'package:mobile/todo/repo/todo_services.dart';

import '../repo/api_status.dart';

class TodoModelView extends ChangeNotifier {
  bool _loading = false;
  bool _success = false;
  List<TodoModel> _todoList = [];
  String _todoError = '';
  late TodoModel _selectedTodo;
  bool _isChecked = false;
  TodoModel _newTodo = TodoModel(
      createdAt: '',
      name: '',
      description: '',
      status: false,
      id: Random().nextInt(100000).toString());

  bool get loading => _loading;
  List<TodoModel> get todoList => _todoList;
  String get todoError => _todoError;
  TodoModel get selectedTodo => _selectedTodo;
  bool get isChecked => _isChecked;

  TodoModelView() {
    getUsers();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setSelectedUser(TodoModel todo) {
    _selectedTodo = todo;
    notifyListeners();
  }

  setUsersList(List<TodoModel> todolist) {
    _todoList = todolist;
  }

  setChecked(String id) {
    _isChecked = !_isChecked;
    TodoModel _selected = _todoList.firstWhere((element) => element.id == id);
    if (_selected != null) {
      _selected.status = !_selected.status;
    }
    notifyListeners();
  }

  createTodo(String title, String description) async {
    _newTodo.name = title;
    _newTodo.description = description;
    _newTodo.createdAt = DateTime.now().toString();
    _newTodo.status = false;
    _todoList.insert(0, _newTodo);
    notifyListeners();
    var response = await TodoServices.createTodo(_newTodo);

    if (response is Success) {
      print('success');
      _newTodo = TodoModel(
          createdAt: '',
          name: '',
          description: '',
          status: false,
          id: Random().nextInt(100000).toString());
    }
    if (response is Failure) {
      _success = false;
      print('failure');
      _newTodo = TodoModel(
          createdAt: '',
          name: '',
          description: '',
          status: false,
          id: Random().nextInt(100000).toString());
    }
  }

  setUserError(String error) {
    _todoError = error;
  }

  deleteTodo(TodoModel todo) {
    _todoList.removeWhere((element) => element.id == todo.id);
    notifyListeners();
    var response = TodoServices.deleteTodo(todo);
    print(response);
  }

  getUsers() async {
    setLoading(true);
    var response = await TodoServices.getTodo();
    if (response is Success) {
      setUsersList(response.response as List<TodoModel>);
    }
    if (response is Failure) {
      setUserError('${response.error_response}');
    }
    setLoading(false);
  }
}
