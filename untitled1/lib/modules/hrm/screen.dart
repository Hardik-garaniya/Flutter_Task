import 'package:flutter/material.dart';

class HRMModuleScreen extends StatefulWidget {
  @override
  _HRMModuleScreenState createState() => _HRMModuleScreenState();
}

class _HRMModuleScreenState extends State<HRMModuleScreen> {
  List<String> employees = ['John Doe', 'Jane Smith'];
  List<String> attendance = [];
  List<String> leaveRequests = [];

  final _nameController = TextEditingController();
  final _leaveController = TextEditingController();

  void _addEmployee() {
    if (_nameController.text.isNotEmpty) {
      setState(() => employees.add(_nameController.text));
      _nameController.clear();
    }
  }

  void _markAttendance(String name) {
    setState(() => attendance.add('$name checked in'));
  }

  void _requestLeave(String name) {
    setState(() => leaveRequests.add('$name: ${_leaveController.text}'));
    _leaveController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HRM Module')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Employee List:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...employees.map((e) => ListTile(
              title: Text(e),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: Icon(Icons.login), onPressed: () => _markAttendance(e)),
                  IconButton(icon: Icon(Icons.time_to_leave), onPressed: () => _requestLeaveDialog(e)),
                ],
              ),
            )),
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Add Employee')),
            ElevatedButton(onPressed: _addEmployee, child: Text('Add')),
            Divider(),
            Text('Attendance:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...attendance.map((a) => Text(a)),
            Divider(),
            Text('Leave Requests:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...leaveRequests.map((l) => Text(l)),
          ],
        ),
      ),
    );
  }

  void _requestLeaveDialog(String name) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Leave Request'),
        content: TextField(
          controller: _leaveController,
          decoration: InputDecoration(hintText: 'Reason'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _requestLeave(name);
              Navigator.pop(context);
            },
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}