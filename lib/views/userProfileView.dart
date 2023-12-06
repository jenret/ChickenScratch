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
  void initState() {
    user = UserModel(userUUID: '12345', username: 'wow', displayname: 'wow', profilePicturePath: '', bannerPicturePath: '');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: httpService.checkConnected(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Scaffold(
                drawer: HamburgerBarMenuView(),
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
                                color: Colors.blueGrey,
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
    );
  }
}