import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile/todo/model/todo.dart';
import 'package:mobile/utils/constants.dart';

import 'api_status.dart';

class TodoServices {
  static Future getTodo() async {
    try {
      var url = Uri.parse(TODOS_URL);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return Success(code: 200, response: TodoModelFromJson(response.body));
      }
      return Failure(
          code: TODO_Invalid_Response, error_response: "Invalid Response");
    } on HttpException {
      return Failure(code: No_Internet, error_response: "No Internet");
    } on SocketException {
      return Failure(code: No_Internet, error_response: "No Internet");
    } on FormatException {
      return Failure(code: Invalid_Format, error_response: "Invalid Format");
    } catch (e) {
      return Failure(code: Unknown_Error, error_response: "Unknown Error");
    }
  }

  static Future createTodo(TodoModel todo) async {
    try {
      var url = Uri.parse(TODOS_URL);
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(todo));
      print('@@@@' + response.statusCode.toString());
      if (response.statusCode == 201) {
        return Success(code: 201, response: 'Success');
      }
      return Failure(
          code: TODO_Invalid_Response, error_response: "Invalid Response");
    } on HttpException {
      return Failure(code: No_Internet, error_response: "No Internet");
    } on SocketException {
      return Failure(code: No_Internet, error_response: "No Internet");
    } on FormatException {
      return Failure(code: Invalid_Format, error_response: "Invalid Format");
    } catch (e) {
      return Failure(code: Unknown_Error, error_response: "Unknown Error");
    }
  }

  static Future deleteTodo(TodoModel todo) async {
    try {
      var url = Uri.parse(TODOS_URL + '/${todo.id}');
      var response = await http.delete(url);
      print('@@@@' + response.statusCode.toString());
      if (response.statusCode == 201) {
        return Success(code: 201, response: 'success');
      }
      return Failure(
          code: TODO_Invalid_Response, error_response: "Invalid Response");
    } on HttpException {
      return Failure(code: No_Internet, error_response: "No Internet");
    } on SocketException {
      return Failure(code: No_Internet, error_response: "No Internet");
    } on FormatException {
      return Failure(code: Invalid_Format, error_response: "Invalid Format");
    } catch (e) {
      return Failure(code: Unknown_Error, error_response: "Unknown Error");
    }
  }
}
