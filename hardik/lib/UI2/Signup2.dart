import 'package:flutter/material.dart';
import 'homescreen2.dart';
import 'login.dart';

class Signup2 extends StatelessWidget {

  final TextEditingController name= TextEditingController();
  final TextEditingController email= TextEditingController();
  final TextEditingController password= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Singup",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40,),

            TextField(
              controller: name,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle),
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 20,),

            TextField(
              controller: email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 20,),

            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 30,),

            ElevatedButton(
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12)
              ),

              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodHomeScreen()));

              },

              child:Text("SIGNUP",style: TextStyle(fontSize: 18,color: Colors.black,),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>login2()));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(color:Colors.green),
                  ),
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}

























// import 'package:flutter/material.dart';
//
// class login2 extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Login",
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 40),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.email_outlined),
//                 hintText: "Email",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.lock_outline),
//                 hintText: "Password",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//               ),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
//               ),
//               onPressed: () {
//                 // Navigator.pushReplacement(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) =>  FoodHomeScreen()),
//                 // );
//               },
//               child: const Text(
//                 "LOG IN",
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Don't have an account? "),
//                 GestureDetector(
//                   onTap: () {
//                     //Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
//                   },
//                   child: const Text(
//                     "Sign up",
//                     style: TextStyle(color: Colors.green),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
