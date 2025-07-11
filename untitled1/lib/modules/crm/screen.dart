import 'package:flutter/material.dart';

class CRMModuleScreen extends StatefulWidget {
  @override
  _CRMModuleScreenState createState() => _CRMModuleScreenState();
}

class _CRMModuleScreenState extends State<CRMModuleScreen> {
  List<Map<String, String>> leads = [];
  final nameCtrl = TextEditingController();
  final statusList = ['New', 'Contacted', 'Closed'];

  void _addLead() {
    if (nameCtrl.text.isNotEmpty) {
      setState(() => leads.add({'name': nameCtrl.text, 'status': 'New'}));
      nameCtrl.clear();
    }
  }

  void _changeStatus(int index) {
    setState(() {
      final currentStatus = leads[index]['status'];
      final nextIndex = (statusList.indexOf(currentStatus!) + 1) % statusList.length;
      leads[index]['status'] = statusList[nextIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CRM Module')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: 'Lead Name')),
            ElevatedButton(onPressed: _addLead, child: Text('Add Lead')),
            Divider(),
            ...leads.asMap().entries.map((entry) => ListTile(
              title: Text(entry.value['name']!),
              subtitle: Text('Status: ${entry.value['status']}'),
              trailing: IconButton(
                icon: Icon(Icons.track_changes),
                onPressed: () => _changeStatus(entry.key),
              ),
            )),
          ],
        ),
      ),
    );
  }
}