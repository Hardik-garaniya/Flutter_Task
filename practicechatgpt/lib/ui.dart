// import 'package:flutter/material.dart';
//
// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Create Account',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 40),
//
//               // Full Name
//               _customTextField(
//                 icon: Icons.person,
//                 hintText: 'Full Name',
//               ),
//               SizedBox(height: 20),
//
//               // Email
//               _customTextField(
//                 icon: Icons.email,
//                 hintText: 'Email Address',
//               ),
//               SizedBox(height: 20),
//
//               // Password
//               _customTextField(
//                 icon: Icons.lock,
//                 hintText: 'Password',
//                 obscureText: true,
//               ),
//               SizedBox(height: 40),
//
//               // Signup Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Handle signup logic here
//                   },
//                   child: Text(
//                     'Sign Up',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//
//               // Already have an account?
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     // Navigate to login screen
//                   },
//                   child: Text(
//                     "Already have an account? Login",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _customTextField({
//     required IconData icon,
//     required String hintText,
//     bool obscureText = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: TextField(
//         obscureText: obscureText,
//         style: TextStyle(color: Colors.white),
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: Colors.white54),
//           hintText: hintText,
//           hintStyle: TextStyle(color: Colors.white38),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
//
// class ListViewScreen extends StatelessWidget {
//   ListViewScreen({super.key});
//
//   final List<UserModel> userList = List.generate(
//     10,
//         (index) => UserModel(
//       name: 'User ${index + 1}',
//       email: 'user${index + 1}@example.com',
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text('User List'),
//       ),
//       body: ListView.builder(
//         itemCount: userList.length,
//         itemBuilder: (context, index) {
//           final user = userList[index];
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey[900],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.deepPurple,
//                   child: Text(
//                     user.name[0],
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 title: Text(
//                   user.name,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//                 subtitle: Text(
//                   user.email,
//                   style: const TextStyle(color: Colors.white70),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class UserModel {
//   final String name;
//   final String email;
//
//   UserModel({required this.name, required this.email});
// }