import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktech/provider.dart';
import 'modelpro.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [Image.network(product.image, height: 200),
            SizedBox(height: 16), Text(product.title, style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),

            Text("\$${product.price}", style: TextStyle(fontSize: 18, color: Colors.green)),
            SizedBox(height: 8),
            Text("Rating: ${product.rating} ⭐"),
            SizedBox(height: 16),

            Text(product.description),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => cart.addToCart(product),
              child: Text("Add to Cart"),
            )
          ],
        ),
      ),
    );
  }
}