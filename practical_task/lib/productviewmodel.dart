import 'package:flutter/material.dart';

class ProductViewModel extends StatelessWidget {
  final List list;

  ProductViewModel({required this.list});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Defines the number of columns (you can adjust as needed)
        crossAxisSpacing: 10.0, // Horizontal space between grid items
        mainAxisSpacing: 10.0, // Vertical space between grid items
        childAspectRatio: 0.8, // Adjust the aspect ratio for grid items
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        var product = list[index];

        return Card(
          elevation: 4.0, // Adds a shadow effect to the card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded corners for card
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Displaying the product image (from pimage field)
              product["pimage"] != null
                  ? Image.network(
                product["pimage"], // Assuming pimage is a URL
                height: 120.0,
                width: double.infinity,
                fit: BoxFit.cover, // Adjust the image to cover the space
              )
                  : Container(
                height: 120.0,
                width: double.infinity,
                color: Colors.grey[300], // Placeholder if no image available
                child: Center(
                  child: Text(
                    'No Image',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product["product_name"] ?? 'Unknown Product',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('Price: \$${product["product_price"] ?? "N/A"}'),
                    SizedBox(height: 5),
                    Text(
                      'Description: ${product["product_description"] ?? "No description"}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 5),
                    // Display the status of the product (pstatus)
                    if (product["pstatus"] != null)
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: product["pstatus"] == "Available"
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          product["pstatus"]!,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
