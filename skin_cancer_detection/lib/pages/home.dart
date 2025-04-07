Commande ECHO activ�e.
import 'package:flutter/material.dart';
import 'upload_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Skin Cancer Detection')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to Skin Cancer Detection', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UploadImagePage()),
                );
              },
              child: Text('Start Analysis'),
            ),
          ],
        ),
      ),
    );
  }
}
