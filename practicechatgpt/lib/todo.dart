import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<String> todos = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTodos = prefs.getStringList('todoList') ?? [];
    setState(() {
      todos = savedTodos;
    });
  }

  Future<void> saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', todos);
  }

  void addTodo(String text) {
    if (text.isEmpty) return;
    setState(() {
      todos.add(text);
      controller.clear();
    });
    saveTodos();
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
    saveTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Enter task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => addTodo(controller.text),
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: todos.isEmpty
                ? Center(child: Text('No tasks yet.'))
                : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(todos[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () => deleteTodo(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
