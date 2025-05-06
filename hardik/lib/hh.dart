import 'package:flutter/material.dart';

class list extends StatefulWidget {
  const list({super.key});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {

  List<String> fruite =["apple","banana"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: fruite.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(fruite[index]),
              onTap: ()=>print(fruite[index])
            );
          }

      ),
    );
  }
}
