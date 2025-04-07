Commande ECHO activ�e.
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UploadImagePage extends StatefulWidget {
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? _image;
  final picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Function to upload image to the backend
  Future<void> _uploadImage() async {
    if (_image == null) return;
    var request = http.MultipartRequest('POST', Uri.parse('http://localhost:8000/predict'));
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path, filename: basename(_image!.path)));
    var res = await request.send();

    if (res.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected')
                : Image.file(_image!, width: 250, height: 250),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick an Image'),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload and Analyze'),
            ),
          ],
        ),
      ),
    );
  }
}
