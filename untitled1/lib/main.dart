import 'package:flutter/material.dart';

import 'modules/crm/screen.dart';
import 'modules/hrm/screen.dart';
import 'modules/payroll/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HRM CRM Payroll App',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modules')),
      body: ListView(
        children: [
          ListTile(
            title: Text('1. HRM Module'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HRMModuleScreen()),
            ),
          ),
          ListTile(
            title: Text('2. CRM Module'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CRMModuleScreen()),
            ),
          ),
          ListTile(
            title: Text('3. Payroll Module'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PayrollModuleScreen()),
            ),
          ),
        ],
      ),
    );
  }
}