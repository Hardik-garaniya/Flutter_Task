import 'package:flutter/material.dart';


void main()
{
  runApp(MaterialApp(home: counter(),));
}

class counter extends StatefulWidget {
  const counter({super.key});

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {

  int counter = 0;
  bool isdark =false;

  void increment(){

    setState(() {
      counter++;
    });
  }

  void decrement(){
    setState(() {
      counter--;
      if(counter < 0){
        counter =0;
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Count can't be negative")),
        );
      }
    });
  }

  void reset(){
    setState(() {
      counter=0;
    });
  }


  void backcolor(){
    setState(() {
       isdark = !isdark;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: isdark ? Colors.black: Colors.white,

      appBar: AppBar(title: Text("counter app"),),

      body: Center(

        child: Text(

            "Counter : $counter",
            style: TextStyle(fontSize: 28),
        ),

),
      floatingActionButton: Row
        (
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          FloatingActionButton(
              onPressed: increment,
            child: Icon(Icons.add),
          ),

          SizedBox(width: 40,),

          FloatingActionButton(
            onPressed: decrement,
            child: Icon(Icons.ac_unit),
          ),
          SizedBox(width: 40,),

          FloatingActionButton(
              onPressed:reset,
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 40,),

            FloatingActionButton(
              onPressed:backcolor,
              child: Icon(Icons.brightness_6),

            )

        ],
      ),

    );
  }
}
