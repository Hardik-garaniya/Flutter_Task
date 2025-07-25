import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktech/provider.dart';
import 'screen/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fake Store',
        theme: ThemeData.dark(),
        home: HomeScreen(),
      ),
    );
  }
}