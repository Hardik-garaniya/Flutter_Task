import 'package:flutter/material.dart';

class alertdialog extends StatefulWidget {
  const alertdialog({super.key});

  @override
  State<alertdialog> createState() => _alertdialogState();
}

class _alertdialogState extends State<alertdialog> {

  List<String> students = ['Rahul', 'Priya', 'Aman', 'Kriti', 'Varun'];


  void showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Delete'),
        content: Text('Delete ${students[index]}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              String deletedName = students[index];
              setState(() {
                students.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$deletedName deleted')),
              );
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alertdialog with Delete"),
      backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: students.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(students[index]),
              onLongPress: ()=> showDeleteDialog(index),
            );
          }
      ),
    );
  }
}
