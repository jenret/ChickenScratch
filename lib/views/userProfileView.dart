import 'package:flutter/material.dart';
import 'package:chicken_ui/HttpService.dart';
import './allViews.dart';
import 'package:chicken_ui/models/userModel.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  late UserModel user;
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: httpService.checkConnected(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: 150,
                      backgroundColor: Colors.greenAccent,
                      flexibleSpace: Stack(
                        children: [
                        Positioned.fill(child: Container(
                          color: Colors.greenAccent,
                        ),
                        ),
                          Positioned(
                              bottom: 0,
                              child: CircleAvatar(
                            backgroundImage: NetworkImage('assets/images/defaultpfp.jpg'),
                            radius: 45,
                          ))
                      ],)
                    ),
                    SliverPadding(
                        padding: const EdgeInsets.all(8),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Text(
                              user.displayname,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '@${user.username}',
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.greenAccent,
                              ),
                            )
                          ]
                        ),
                      ),
                    )
                  ],
                ),
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                ),
                child: Text('Display Name'),
            ),
            ListTile(
              title: const Text('Topics'),
              onTap: () {
                print('go to topics');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                print('go to user profile');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                print('go to settings');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                print('end session');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('New Note'),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateNoteView())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}