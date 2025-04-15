import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practical_task/update.dart';

class ProductViewScreen extends StatefulWidget {
  @override
  _ProductViewScreenState createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  bool isLoading = true;  // For loading state
  String errorMessage = '';  // To store error message if any

  Future<List> getProductData() async {
    var url = Uri.parse("https://prakrutitech.buzz/Practical_Task/productview.php");
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        return jsonDecode(response.body);
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load products';
        });
        throw Exception('Failed to load products');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error: $e';
      });
      throw Exception('Error fetching data');
    }
  }

  Future<void> deleteProduct(String productId) async {
    var url = Uri.parse("https://prakrutitech.buzz/Practical_Task/productdelete.php");
    try {
      var response = await http.post(url, body: {"pid": productId});

      if (response.statusCode == 200) {
        print('Product deleted successfully');
        setState(() {});  // Refresh the product list after deletion
      } else {
        print('Error deleting product');
      }
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.grey,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: FutureBuilder<List>(
          future: getProductData(),
          builder: (context, snapshot) {
            if (isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError || errorMessage.isNotEmpty) {
              return Center(child: Text(errorMessage.isNotEmpty ? errorMessage : 'Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No products available.'));
            }

            List products = snapshot.data!;
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                String imageUrl = product["pimage"] ?? "";

                return Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 4,
                  child: Column(
                    children: [
                      // Display product image with a fallback for errors
                      imageUrl.isNotEmpty
                          ? Image.network(
                        imageUrl,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/flower1.jpg',  // Default placeholder
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                          : Image.asset(
                        'assets/flower2.jpg', // Fallback image if URL is empty
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product["pname"] ?? "No name",  // Safely handle null values
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Price: \$${product["pprice"] ?? "0"}',  // Default to "0" if price is null
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Description: ${product["pdesc"] ?? "No description"}',  // Default to fallback description
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateScreen(
                                    pid: product["pid"] ?? "",
                                    pname: product["pname"] ?? "No name",
                                    price: product["pprice"] ?? "0",
                                    pdesc: product["pdesc"] ?? "No description",
                                    pimage: product["pimage"] ?? "",
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.black),
                            tooltip: 'Edit Product',
                          ),
                          IconButton(
                            onPressed: () async {
                              // Call delete product API
                              await deleteProduct(product["pid"] ?? "");
                              // Refresh the list after deletion
                              setState(() {});
                            },
                            icon: Icon(Icons.delete, color: Colors.black),
                            tooltip: 'Delete Product',
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
