import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../store/home/actions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Profile page',
            ),
          ],
        ),
      ),
    );
  }
}
