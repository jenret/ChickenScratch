import 'package:chicken_ui/views/allViews.dart';
import 'package:flutter/material.dart';
import 'package:chicken_ui/HttpService.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final TextEditingController firstName;
  late final TextEditingController lastName;
  DateTime birthdate = DateTime.now();
  late final TextEditingController username;
  late final TextEditingController displayname;
  late final TextEditingController email;
  late final TextEditingController password;
  final HttpService httpService = HttpService();

  @override
  void initState() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    username = TextEditingController();
    displayname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    username.dispose();
    displayname.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                        controller: firstName,
                        maxLength: 50,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            hintText: 'First Name'
                        ),
                      ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 400,
                        child: TextField(
                          controller: lastName,
                          maxLength: 50,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                              hintText: 'Last Name'
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Text(
                          '${birthdate.month}/${birthdate.day}/${birthdate.year}',
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                        child: ElevatedButton(
                          onPressed: () async {
                            final result = await showDatePicker(
                              context: context,
                              initialDate: birthdate,
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365 * 2),
                              ),
                              helpText: 'Select Birthdate',
                              fieldLabelText: 'Enter Birthdate',
                              errorFormatText: 'Invalid Date',
                            );

                            if (result != null) {
                              setState(() {
                                birthdate = result;
                              });
                            }
                          },
                          child: const Text('Birthdate'),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 400,
                        child: TextField(
                          controller: username,
                          maxLength: 50,
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
                          controller: displayname,
                          maxLength: 50,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                              hintText: 'Display Name'
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 400,
                        child: TextField(
                          controller: email,
                          maxLength: 62,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: 'Email'
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
                            final txtFirstName = firstName.text;
                            final txtLastName = lastName.text;
                            final txtBirthdate = birthdate.toString();
                            final txtUsername = username.text;
                            final txtDisplayName = displayname.text;
                            final txtEmail = email.text;
                            final txtPassword = password.text;
                            try {
                              // here you send user to api
                              // make sure that the api return a user
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginView()),
                              );
                            } catch (e) {
                              // handle exception
                              //maybe weak pass, email/username in use, invalid email
                              print('Error occured:');
                              print(e.runtimeType);
                              print(e);
                            }
                          }, child: const Text('Sign Up'),
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