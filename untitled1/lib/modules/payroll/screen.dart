import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PayrollModuleScreen extends StatefulWidget {
  @override
  _PayrollModuleScreenState createState() => _PayrollModuleScreenState();
}

class _PayrollModuleScreenState extends State<PayrollModuleScreen> {
  final employees = ['John Doe', 'Jane Smith'];
  final salaryRecords = <String>[];
  final baseSalary = 30000;

  void _generatePayslip(String employee) async {
    final net = baseSalary - 2000; // dummy deduction
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text("Payslip for $employee\nSalary: ₹$net\nDeduction: ₹2000"),
        ),
      ),
    );
    salaryRecords.add("$employee - ₹$net");
    await Printing.layoutPdf(onLayout: (format) => doc.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payroll Module')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...employees.map((e) => ListTile(
              title: Text(e),
              trailing: IconButton(
                icon: Icon(Icons.picture_as_pdf),
                onPressed: () => _generatePayslip(e),
              ),
            )),
            Divider(),
            Text('Previous Records:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...salaryRecords.map((r) => Text(r))
          ],
        ),
      ),
    );
  }
}