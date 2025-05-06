import 'package:flutter/material.dart';

class FoodHomeScreen extends StatelessWidget {
  const FoodHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Find and favorite dishes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
body: SingleChildScrollView(

  padding: EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12)
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),

            border: InputBorder.none,
          ),
        ),
      ),
      SizedBox(height: 20,),

      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
               _buildCategoryButton("Pizza", true),
                SizedBox(width: 10,),
              _buildCategoryButton('Burgers', false),
                SizedBox(width: 10,),
            _buildCategoryButton('Desserts', false),
            SizedBox(width: 10,),
            _buildCategoryButton('Pasta', false),
            SizedBox(width: 10,),

          ],
        ),
      ),
      SizedBox(height: 25,),

      const Text(
               'Popular',
               style: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.bold,
               ),
            ),
             const SizedBox(height: 15),
      SizedBox(
        height: 210,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index)=> SizedBox(width: 20,),
            itemCount: 3,
            itemBuilder: (context, index){
            final foodlist = [
              {
                 'image': 'https://img.freepik.com/free-photo/pizza-pizza-filled-with-tomatoes-salami-olives_140725-1200.jpg?semt=ais_hybrid&w=740',
                 'title': 'Margherita',
               },
               {
                'image': 'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2021/09/beef-burger.jpg?im=AspectCrop=(16,9);',
                 'title': 'Veggie Burger',
              },
              {
                 'image': 'https://media.istockphoto.com/id/1370520449/photo/slice-of-chocolate-cake-with-glaze.jpg?s=612x612&w=0&k=20&c=KK-h7w4l0FNA0YMWvkr1X8UrAAB77z0f5tTByBYgReM=',
                 'title': 'Chocolate Cake',
               },

    ];

            return _buildFoodCard(
               imageUrl: foodlist[index]['image']!,
               title: foodlist[index]['title']!,
             );

                },


        ),
      )
    ],
  ),
),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),

        ],
      ),
    );


  }
}


Widget _buildCategoryButton(String text, bool isSelected){
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.green.shade50 :  Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isSelected ? Colors.green : Colors.transparent,
        width: 5,
      ),
    ),
    child: Padding(

      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),

  child: Text(
          text,
           style: TextStyle(
            color: isSelected ? Colors.green : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),

  ),
  );
}

Widget _buildFoodCard({required String imageUrl, required String title}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 150,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0,4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
              imageUrl,
          fit: BoxFit.cover,
          ),

        ),
      ),
      SizedBox(height: 8,),
      Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
    ],
  );
}










