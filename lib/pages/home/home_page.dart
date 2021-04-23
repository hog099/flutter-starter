import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_starter/core/app_colors.dart';
import 'package:flutter_starter/pages/profile/profile_page.dart';
import 'package:flutter_starter/store/theme/theme_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final ThemeStore themeStore;
  HomePage({key, this.themeStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Starter"),
        actions: <Widget>[
          ElevatedButton(
            // onPressed: () => null,
            onPressed: () {
              ThemeType changeTo =
                  themeStore.currentThemeType == ThemeType.light
                      ? ThemeType.dark
                      : ThemeType.light;
              themeStore.changeCurrentTheme(changeTo);
            },
            child: Icon(Icons.brightness_medium),
          )
        ],
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
            ElevatedButton(
              // onPressed: () => null,
              onPressed: () {
                ThemeType changeTo =
                    themeStore.currentThemeType == ThemeType.light
                        ? ThemeType.dark
                        : ThemeType.light;
                themeStore.changeCurrentTheme(changeTo);
              },
              child: Text('Change Theme'),
            ),
            Card(
              child: Observer(builder: (context) {
                return Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: themeStore.currentThemeType == ThemeType.light
                        ? AppColors.white
                        : AppColors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(children: [
                      Text('The current theme is : ${themeStore.themeString}'),
                    ]),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
