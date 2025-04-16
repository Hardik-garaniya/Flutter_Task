import 'package:flutter/material.dart';
import 'package:practicechatgpt/counterapp.dart';
import 'package:practicechatgpt/listgrid.dart';
import 'package:practicechatgpt/navigationdata.dart';
import 'WInkwell.dart';
import 'alertdialog.dart';
import 'formvalidation.dart';

void main(){

  runApp(MaterialApp(home: practice()));
}

class practice extends StatelessWidget {
  const practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      appBar: AppBar(title: Text("Practice Flutter"),
        backgroundColor: Colors.indigo,
      ),
      body: Center
        (
        child: Column
          (
          children: [
            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context , MaterialPageRoute(builder: (context)=> Inkwell()));
            }, child: Text("Inkwell")),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context , MaterialPageRoute(builder: (context)=> counter()));
            }, child: Text("conterapp")),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context , MaterialPageRoute(builder: (context)=> home()));
            }, child: Text("listview & gridview")),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context , MaterialPageRoute(builder: (context)=> formvalidation()));
            }, child: Text("Form Validation")
            ),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context , MaterialPageRoute(builder: (context)=> alertdialog()));
            }, child: Text("Alertdialog"),
            ),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: ()
            {
              Navigator.push(context , MaterialPageRoute(builder: (context)=> firstpage()));
            }, child: Text("Navigation And Pass Data"))


          ],
        ),
      ),
    );
  }
}
