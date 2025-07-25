import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasktech/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: items.isEmpty
          ? Center(child: Text("Cart is Empty"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items.keys.elementAt(index);
                final quantity = items[product]!;
                return ListTile(
                  leading: Image.network(product.image, width: 50),
                  title: Text(product.title), subtitle: Text("Price: \$${product.price} x $quantity"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => cart.changeQuantity(product, quantity - 1)),
                      Text('$quantity'),
                      IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => cart.changeQuantity(product, quantity + 1)),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => cart.removeFromCart(product)),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Total: \$${cart.totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20)),
          )
        ],
      ),
    );
  }
}