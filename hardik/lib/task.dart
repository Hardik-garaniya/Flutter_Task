import 'package:flutter/material.dart';


class TaskHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task Hub',
      debugShowCheckedModeBanner: false,
      home: TaskHomePage(),
    );
  }
}

class TaskHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {'title': 'Login Screen', 'widget': LoginScreen()},
    {'title': 'ListView of Names', 'widget': NameListScreen()},
    {'title': 'Screen Navigation', 'widget': FirstPage()},
    {'title': 'Counter App', 'widget': CounterScreen()},
    {'title': 'GridView Colored Boxes', 'widget': GridScreen()},
    {'title': 'Form Validation', 'widget': FormScreen()},
    {'title': 'Alert Dialog Box', 'widget': AlertScreen()},
    {'title': 'Todo Task App', 'widget': TodoTaskScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Flutter Tasks")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]['title']),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => tasks[index]['widget']),
              );
            },
          );
        },
      ),
    );
  }
}

//////////////////////////
// 1. Login Screen Task
//////////////////////////

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("Email: ${emailController.text}");
                print("Password: ${passwordController.text}");
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////
// 2. ListView Task
//////////////////////////

class NameListScreen extends StatelessWidget {
  final List<String> names = ["Aman", "Neha", "Ravi", "Priya", "Raj"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView of Names")),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(names[index]));
        },
      ),
    );
  }
}

//////////////////////////
// 3. Navigation Task
//////////////////////////

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Page")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Second"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Center(child: Text("Welcome to Second Page!", style: TextStyle(fontSize: 18))),
    );
  }
}

//////////////////////////
// 4. Counter App Task
//////////////////////////

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: $count", style: TextStyle(fontSize: 24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => setState(() => count++), child: Text("+")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: () => setState(() => count--), child: Text("-")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////
// 5. GridView Task
//////////////////////////

class GridScreen extends StatelessWidget {
  final List<Color> colors = [
    Colors.red, Colors.blue, Colors.green,
    Colors.orange, Colors.purple, Colors.teal
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Colored Grid Boxes")),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(colors.length, (index) {
          return GestureDetector(
            onTap: () => print("Box $index tapped!"),
            child: Container(
              margin: EdgeInsets.all(10),
              color: colors[index],
              height: 100,
            ),
          );
        }),
      ),
    );
  }
}

//////////////////////////
// 6. Form Validation Task
//////////////////////////

class FormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Validation")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Enter Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Name cannot be empty";
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print("Name: ${nameController.text}");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////
// 7. AlertDialog Task
//////////////////////////

class AlertScreen extends StatelessWidget {
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              print("No clicked");
            },
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              print("Yes clicked");
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Dialog")),
      body: Center(
        child: ElevatedButton(
          child: Text("Show Alert"),
          onPressed: () => showAlert(context),
        ),

      ),
    );


  }
}

class TodoTaskScreen extends StatefulWidget {
  @override
  _TodoTaskScreenState createState() => _TodoTaskScreenState();
}

class _TodoTaskScreenState extends State<TodoTaskScreen> {
  final List<String> _todos = [];
  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _todos.add(_taskController.text);
        _taskController.clear();
      });
    }
  }

  void _deleteTask(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _editTask(int index) {
    _taskController.text = _todos[index];
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Edit Task"),
        content: TextField(controller: _taskController),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _todos[index] = _taskController.text;
                _taskController.clear();
              });
              Navigator.pop(ctx);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Task List")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: "Enter task"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _addTask, child: Text("Add Task")),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todos[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: Icon(Icons.edit), onPressed: () => _editTask(index)),
                        IconButton(icon: Icon(Icons.delete), onPressed: () => _deleteTask(index)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
