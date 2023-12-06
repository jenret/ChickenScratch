import 'package:flutter/material.dart';
import 'package:chicken_ui/HttpService.dart';
import './allViews.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController username;
  late final TextEditingController password;
  final HttpService httpService = HttpService();

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: FutureBuilder(
        future: httpService.checkConnected(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      width: 400,
                      child: TextField(
                        controller: username,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            hintText: 'Username'
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 400,
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            hintText: 'Password'
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: TextButton(
                        onPressed: () async {
                          final txtUsername = username.text;
                          final txtPassword = password.text;
                          try {
                            // here you send user to api
                            // make sure that the api return a user
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const UserProfileView()),
                            );
                          } catch (e) {
                            // handle exception like user not found/wrong password
                            print('Error occured:');
                            print(e.runtimeType);
                            print(e);
                          }
                        }, child: const Text('Login'),
                      ),
                    ),
                  ),
                ],
              );
            default:
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(
                      color: Colors.greenAccent,
                      backgroundColor: Colors.black12,
                    ),
                  ),
                  Center(
                    child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('Loading...'),
                    ),
                  )
                ],
              );
          }
        },
      )
    );
  }
}