import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController surnamecontroller = TextEditingController();
  String gender = "Male";
  String imagepath = "assets/swaraj.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen"),
      backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Card(
          color: Colors.teal,
          child: Container(
            height: 300,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(labelText: 'Enter Name'),
                ),
                TextField(
                  controller: surnamecontroller,
                  decoration: InputDecoration(labelText: 'Enter Surname'),
                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                   Radio(
                       value: 'Male',
                       groupValue: gender,
                       onChanged: (val){
                         setState(() => gender = val!

                         );
                       }
                   ),
                    Text("Male"),
                    Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged:(val){
                          setState(() => gender = val!);
                        }
                    ),
                    Text("Female")

                  ],
                ),
                SizedBox(height: 20,),

                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>secondpage(

                                name: namecontroller.text,
                                surname:surnamecontroller.text,
                                gender:gender,
                                imagepath:imagepath,
                              )));
                    },
                    child: Text("Submit")
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}



//// Second Screen

class secondpage extends StatelessWidget {

  final String name;
  final String surname;
  final String gender;
  final String imagepath;

  secondpage({
    required this.name,
    required this.surname,
    required this.gender,
    required this.imagepath,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen "),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Card(
          color: Colors.teal,
          elevation: 10,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(imagepath),

                ),
                SizedBox(height: 20,),
                Text("Name : $name", style: TextStyle(fontSize: 25),),
                Text("Surname : $surname", style: TextStyle(fontSize: 25),),
                Text("Gender : $gender", style: TextStyle(fontSize: 25),),


              ],
            ),

          ),
        ),
      ),
    );
  }
}


