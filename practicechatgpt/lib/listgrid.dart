import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: home(),));
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold
          (
          appBar: AppBar(title: Text("Listview & Gridview"),
          bottom:TabBar
            (
            tabs: [
              Tab(text: "Listview",),
              Tab(text: "Gridview",)

            ],
          ),

    ),
          body: TabBarView(
            children: [
              Listview(),
              Gridview(),
            ],
          ),
        )
    );
  }
}


class Listview extends StatefulWidget {

  @override
  State<Listview> createState() => _listgridState();
}

class _listgridState extends State<Listview> {

  final List<String> Student =[
    'Rahul',
    'Priya',
    'Aman',
    'Kriti',
    // 'Varun',
    // 'Sneha',
    // 'Aditya',
    // 'Nisha',
    // 'Karan',
    // 'Riya',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: ListView.builder(
        itemCount: Student.length,
          itemBuilder: (context, index){

          return ListTile(

            leading: CircleAvatar(child: Text(Student[index][0])),
            title: Text(Student[index]),
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${Student[index]} tapped'))
              );
            },
          );
          }

      ),
      
    );
  }
}

class Gridview extends StatefulWidget {
  const Gridview({super.key});

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
  final List<String> Products=
  [
    'Shoes',
    'Shirt',
    'Watch',
    'Phone',
    'Camera',
    'Laptop'
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: Products.length,

        itemBuilder: (context, index){
          return Card(
            color: Colors.amber,
            child: Text(
              Products[index],
              style: TextStyle(fontSize: 18),
            ),
          );
        }
    );
  }
}

