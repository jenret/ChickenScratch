import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController username;
  late final TextEditingController password;

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
        future: null,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                    controller: username,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'username'
                    ),
                  ),
                  TextField(
                    controller: password,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                        hintText: 'Password'
                    ),
                  )
                  // TextButton(
                  //   onPressed: () async {
                  //     final txtEmail = email.text;
                  //     final txtPassword = password.text;
                  //     try {
                  //     // here you send user to api
                  //     } catch (e) {
                  //      // handle exception like user not found/wrong password
                  //       print('Error occured:');
                  //       print(e.runtimeType);
                  //       print(e);
                  //     }
                  //   },
                  // )
                ],
              );
            default:
              return const Text('Loading');
          }
        },
      )
    );
  }
}