import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chicken_ui/HttpService.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  File ? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close, size: 30),
        ),
        actions: [
          ButtonTheme(
              minWidth: 100,
              child: ElevatedButton(
              onPressed: () {},
              child: const Text('Post',
                style: TextStyle(
                  color: Colors.black,
                ),
              )
          )),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.camera_alt_outlined, size: 40,)
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Icon(Icons.upload, size: 40,)
            ),
          ),
          const SizedBox(height: 20,),
          image != null ? Image.file(image!) : const Text('No image to display')
        ],
      ),
    );
  }

  Future pickImage() async {
    try {
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) return;
      setState(() { image = File(returnedImage!.path);
      });
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  
}