import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: formvalidation(),
debugShowCheckedModeBanner: false,
  )
  );
}

class formvalidation extends StatefulWidget {
  const formvalidation({super.key});

  @override
  State<formvalidation> createState() => _formvalidationState();
}

class _formvalidationState extends State<formvalidation> {

  final _formkey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();

  void submitform(){
    if(_formkey.currentState!.validate()){
      String name = namecontroller.text;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Form Submitted By $name")),
      );

      namecontroller.clear();
      emailcontroller.clear();
      mobilecontroller.clear();

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.black,
     appBar: AppBar(title: Text("Student Admission Form"),
     backgroundColor:Colors.lightGreenAccent ,
     ),

      body: Center(

        child: Card(
          color: Colors.lightGreenAccent,
          elevation: 8,
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding
            (
            padding: const EdgeInsets.all(20.0),

              child: Container(
                height: 350,
                width: 350,
                child: Form
                  (
                  key: _formkey,
                  child: Column(
                    children: [

                      TextFormField(
                        controller: namecontroller,
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'plese enter your name';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value){
                          if(value==null || !value.contains('@')){
                            return 'plese enter a valid email';
                          }
                          return null;
                        },

                      ),

                      TextFormField(
                        controller: mobilecontroller,
                        decoration: InputDecoration(labelText: 'Mobile'),
                        validator: (value){
                          if(value==null || value.length !=10){
                            return 'please enter valid mobile number ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25,),
                      ElevatedButton(
                          onPressed: submitform,
                          child: Text("Submit")
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

      ),
    );
  }
}
