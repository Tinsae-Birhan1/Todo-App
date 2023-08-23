import 'package:flutter/material.dart';

const TODOS_URL = 'https://64db1ca9593f57e435b0778b.mockapi.io/api/v1/tasks';
const TODO_Invalid_Response = 100;
const No_Internet = 101;
const Invalid_Format = 102;
const Unknown_Error = 103;

getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
