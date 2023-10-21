
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoappround2/model/Todo.dart';




Future<Todo> fetchTodo() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Todo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Todo');
  }
}