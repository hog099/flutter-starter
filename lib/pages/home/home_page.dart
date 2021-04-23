import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/profile/profile_page.dart';

class HomePage extends StatelessWidget {
  HomePage({required this.title}) : super();

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home Page',
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => ProfilePage()),
              ),
              child: Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
