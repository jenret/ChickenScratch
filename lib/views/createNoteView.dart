import 'package:flutter/material.dart';
import 'package:chicken_ui/HttpService.dart';
import 'allViews.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close, size: 30),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {},
              child: const Text('Post',
                style: TextStyle(
                    backgroundColor: Colors.greenAccent,
                    color: Colors.white,
                ),
              )
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ),
                );
              },
              child: const Icon(Icons.camera_alt_outlined, size: 40,)
          ),
          SizedBox(height: 30,),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ),
                );
              },
              child: const Icon(Icons.upload, size: 40,)
          ),
        ],
      ),
    );
  }
  
}