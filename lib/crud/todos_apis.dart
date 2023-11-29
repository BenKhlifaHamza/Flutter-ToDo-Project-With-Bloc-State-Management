import 'dart:convert';

import 'package:bloc_course_3/models/todo_model.dart';
import 'package:http/http.dart' as http;

class ToDosApi {
  Future<List<TodoModel>> getTodos([int start = 0, int limit = 20]) async {
    try {
      var response = await http.get(Uri.parse(
          "https://jsonplaceholder.typicode.com/todos?_start=$start&_limit=$limit"));
      List toDos = jsonDecode(response.body);
      return toDos.map((item) => TodoModel.fromJson(item)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
