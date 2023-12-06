import 'package:flutter/material.dart';
import 'package:chicken_ui/views/loginView.dart';
import 'package:chicken_ui/views/signupView.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Chicken Scratch',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Chicken Scratch Home'),
      )
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                height: 250,
                width: 250,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Image.asset('assets/images/ChickenScratchLogo.png'),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginView()),
                    );
                  },
                  child: const Text("Login")
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpView()),
                    );
                  },
                  child: const Text("Sign Up")
              ),
            ],)
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


