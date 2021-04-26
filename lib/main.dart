import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_starter/core/app_colors.dart';
import 'package:flutter_starter/pages/splash/splashscreen_page.dart';
import 'core/app_images.dart';
import 'package:flutter_starter/pages/home/home_page.dart';
import 'package:flutter_starter/pages/splash/splash_page.dart';
import 'package:flutter_starter/store/theme/theme_store.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<ThemeStore>(
      create: (_) => ThemeStore(),
    )
  ], child: MyApp()
      // child: new MaterialApp(home: MyApp())
      )); // Runapp
}

class MyApp extends StatelessWidget {
  final ThemeStore themeStore = ThemeStore();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: 'Mobx Theme',
        theme: context.watch<ThemeStore>().currentThemeData,
        home: HomePage(themeStore: themeStore),
      );
    });
  }
}



// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }


// class _MyAppState extends State<MyApp> {
//   final ThemeStore themeStore = ThemeStore();

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter SplashScreen',
//       home: new SplashPage02(),
//       routes: <String, WidgetBuilder>{
//         '/HomePage': (BuildContext context) => new HomePage()
//       },
//     );

//     // return Observer(builder: (context) {
//     //   return new HomePage(themeStore: themeStore);
//     // });
//   }
// }





// TRYING SPLASHSCREEN LILB
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return new SplashScreen(
//       seconds: 3,
//       navigateAfterSeconds: new AfterSplash(),
//       // title: new Text(
//       //   'Welcome In SplashScreen',
//       //   style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//       // ),
//       // image: new Image.asset(AppImages.logo),
//       image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
//       backgroundColor: AppColors.grey,
//       photoSize: 100.0,
//       styleTextUnderTheLoader: new TextStyle(),
//       // loaderColor: AppColors.chartPrimary
//     );
//   }
// }

// class AfterSplash extends StatelessWidget {
//   final ThemeStore themeStore = ThemeStore();
//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (context) {
//       return new HomePage(themeStore: themeStore);
//     });
//   }
// }

