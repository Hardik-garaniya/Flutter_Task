import 'package:flutter/material.dart';


class Inkwell extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: Center
        (
        child: InkWell(
          onDoubleTap: () {
            print("Hello double");
          },
          onTap: () {
            print("Hello on tap");
          },
          onLongPress: () {
            print("Hello on long press");
          },


          child: Container
            (
            height: 200,
            width: 200,
            color: Colors.cyan,
          ),
        ),
      ),
    );
  }
}
