import 'package:flutter/material.dart';
import 'package:practical_task/view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'insert.dart';
import 'login.dart';

class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  final List<String> gridItems = ['Insert', 'View'];

  // Logout function to clear session and navigate back to login screen
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Clear login status and other session data
    await prefs.setBool('isLoggedIn', false); // Clear login status
    await prefs.remove('userEmail'); // Optionally remove the user's email

    // Navigate back to the login screen only if the widget is still mounted
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), // Ensure LoginScreen is your actual login screen
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Set grid layout based on screen width
    int crossAxisCount = MediaQuery.of(context).size.width > 400 ? 2 : 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Screen'),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => logout(context), // Call the logout method here
          ),
        ],
      ),
      body: Center( // Wrap GridView with Center widget to center the grid
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Add padding to make the grid more visually appealing
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: gridItems.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (gridItems[index] == 'Insert') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InsertScreen()),
                    );
                  } else if (gridItems[index] == 'View') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductViewScreen()),
                    );
                  }
                },
                child: Card(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      gridItems[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
