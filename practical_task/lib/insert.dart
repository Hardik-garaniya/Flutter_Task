import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();
  TextEditingController pstatus = TextEditingController();
  File? _imageFile; // Image file placeholder
  bool _isUploading = false; // To show loading indicator

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      print('Image picked: ${_imageFile!.path}');
    }
  }

  Future<void> _uploadData() async {
    if (_validateForm()) {
      setState(() {
        _isUploading = true;
      });

      var url = Uri.parse('https://prakrutitech.buzz/Practical_Task/productinsert.php');

      try {
        var request = http.MultipartRequest('POST', url)
          ..fields['pname'] = pname.text.toString()
          ..fields['pprice'] = pprice.text.toString()
          ..fields['pdesc'] = pdes.text.toString()
          ..fields['pstatus'] = pstatus.text.toString()
          ..files.add(await http.MultipartFile.fromPath('pimage', _imageFile!.path)); // Add image to request

        var response = await request.send(); // Send the request

        if (response.statusCode == 200) {
          _showSnackBar('Product uploaded successfully!', Colors.green);
          _resetForm();
        } else {
          _showSnackBar('Failed to upload data. Error: ${response.statusCode}', Colors.red);
        }
      } catch (e) {
        _showSnackBar("Error: $e", Colors.red);
      } finally {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  // Validate the form fields
  bool _validateForm() {
    if (pname.text.isEmpty ||
        pprice.text.isEmpty ||
        pdes.text.isEmpty ||
        pstatus.text.isEmpty ||
        _imageFile == null) {
      _showSnackBar('Please fill all fields and select an image.', Colors.red);
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

  // Reset form after successful upload
  void _resetForm() {
    pname.clear();
    pprice.clear();
    pdes.clear();
    pstatus.clear();
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product with Image"),
        backgroundColor: Colors.blueAccent, // Updated color for the app bar
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50, // Light background color
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SingleChildScrollView( // Allows scrolling in case the keyboard appears
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("Add Product Details", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade800)),
              SizedBox(height: 20),
              Card(
                color: Colors.white,  // Background of the card
                elevation: 8,  // Gives shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildTextField(controller: pname, label: "Product Name", hint: "Enter product name"),
                      SizedBox(height: 15),
                      _buildTextField(controller: pprice, label: "Product Price", hint: "Enter product price", keyboardType: TextInputType.number),
                      SizedBox(height: 15),
                      _buildTextField(controller: pdes, label: "Product Description", hint: "Enter product description", maxLines: 3),
                      SizedBox(height: 15),
                      _buildTextField(controller: pstatus, label: "Product Status", hint: "Enter product status"),
                      SizedBox(height: 20),

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

                      // Display the image if picked
                      _imageFile != null
                          ? Image.file(_imageFile!, height: 100, width: 100, fit: BoxFit.cover) // Display the picked image
                          : Text('No image selected', style: TextStyle(color: Colors.grey)),

                      SizedBox(height: 20),

                      // Upload Button with loading state
                      ElevatedButton(
                        onPressed: _isUploading || _imageFile == null ? null : _uploadData,
                        child: _isUploading
                            ? CircularProgressIndicator() // Show loading indicator
                            : Text('Upload Product'),
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
            ],
          ),
        ),
      ),
    );
  }

  // A common text field widget
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
