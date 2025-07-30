import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktech/provider.dart';
import 'package:tasktech/screen/productdaetail.dart';
import 'modelpro.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: product)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.image, height: 100),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Text("\$${product.price}", style: TextStyle(color: Colors.green)),
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