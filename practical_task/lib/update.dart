import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UpdateScreen extends StatefulWidget {
  final String pid, pname, price, pdesc, pimage;

  UpdateScreen({required this.pid, required this.pname, required this.price, required this.pdesc, required this.pimage});

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController pnameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController pdesController = TextEditingController();
  File? _imageFile; // Image file placeholder
  bool _isUpdating = false; // To show the loading state

  @override
  void initState() {
    super.initState();
    pnameController.text = widget.pname;
    priceController.text = widget.price;
    pdesController.text = widget.pdesc;
  }

  // Function to pick image from gallery or camera
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      print('Image picked: ${_imageFile!.path}');
    }
  }

  // Function to update product details
  Future<void> updateProduct() async {
    if (_validateForm()) {
      setState(() {
        _isUpdating = true;
      });

      var url = Uri.parse("https://prakrutitech.buzz/Practical_Task/productupdate.php");

      // Create the multipart request for product update
      var request = http.MultipartRequest('POST', url)
        ..fields['pid'] = widget.pid
        ..fields['pname'] = pnameController.text
        ..fields['pprice'] = priceController.text
        ..fields['pdesc'] = pdesController.text;

      // Add image if it has been picked
      if (_imageFile != null) {
        try {
          var imageFile = await http.MultipartFile.fromPath('pimage', _imageFile!.path);
          request.files.add(imageFile);
        } catch (e) {
          print("Error uploading image: $e");
          return;
        }
      }

      // Send the request
      try {
        var response = await request.send();

        if (response.statusCode == 200) {
          _showSnackBar('Product updated successfully!', Colors.green);
          Navigator.pop(context);
        } else {
          _showSnackBar('Failed to update product!', Colors.red);
        }
      } catch (e) {
        print("Failed to connect to the server: $e");
        _showSnackBar('Failed to connect to the server', Colors.red);
      } finally {
        setState(() {
          _isUpdating = false;
        });
      }
    }
  }

  // Validate the form fields
  bool _validateForm() {
    if (pnameController.text.isEmpty ||
        priceController.text.isEmpty ||
        pdesController.text.isEmpty) {
      _showSnackBar('Please fill in all fields!', Colors.red);
      return false;
    }
    return true;
  }

  // Show a snackbar for user feedback
  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        backgroundColor: Colors.blueAccent, // Updated color for the app bar
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView( // Allows scrolling in case of keyboard visibility
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name TextField
              TextField(
                controller: pnameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  hintText: 'Enter product name',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Product Price TextField
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Product Price',
                  hintText: 'Enter product price',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Product Description TextField
              TextField(
                controller: pdesController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Product Description',
                  hintText: 'Enter product description',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Choose Image Button
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Choose Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Button color
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Display the current image if picked, or the current image URL if no new image is selected
              _imageFile != null
                  ? Image.file(_imageFile!, height: 100, width: 100, fit: BoxFit.cover)
                  : widget.pimage.isNotEmpty
                  ? Image.network(widget.pimage, height: 100, width: 100, fit: BoxFit.cover)
                  : Text('No image selected', style: TextStyle(color: Colors.grey)),

              SizedBox(height: 20),

              // Update Product Button
              ElevatedButton(
                onPressed: _isUpdating ? null : updateProduct,
                child: _isUpdating
                    ? CircularProgressIndicator(color: Colors.white) // Show loading indicator while updating
                    : Text('Update Product'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Button color
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
