import 'package:flutter/material.dart';
import 'package:tasktech/producttile.dart';
import '../api.dart';
import '../modelpro.dart';
import 'cart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text('Fake Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen())),
          )
        ],
      ),
        body: FutureBuilder<List<Product>>(future: ApiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;
            return GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductTile(product: products[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load products'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}