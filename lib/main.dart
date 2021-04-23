import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_starter/pages/home/home_page.dart';
import 'package:flutter_starter/store/theme/theme_store.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<ThemeStore>(
      create: (_) => ThemeStore(),
    )
  ], child: MyApp()));
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

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mobx Theme'),
//         actions: <Widget>[
//           ElevatedButton(
//             // onPressed: () => null,
//             onPressed: () => Navigator.push(
//               context,
//               CupertinoPageRoute(builder: (context) => SettingPage()),
//             ),
//             child: Text('Change Theme SettingPage'),
//           ),
//         ],
//       ),
//       body: Center(
//           child: Column(
//         children: <Widget>[
//           Card(
//             child: Observer(builder: (context) {
//               return ListTile(
//                 title: Text(
//                     'The current theme is : ${context.watch<ThemeStore>().themeString}'),
//               );
//             }),
//           ),
//           MaterialButton(
//             color: Colors.deepPurple,
//             textColor: Colors.white,
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => SettingPage()));
//             },
//             child: Text('Go to Setting Page'),
//           )
//         ],
//       )),
//     );
//   }
// }

// class SettingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final themeStore = context.watch<ThemeStore>();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Setting'),
//       ),
//       body: Center(
//         child: MaterialButton(
//           color: Colors.deepPurple,
//           textColor: Colors.white,
//           onPressed: () {
//             ThemeType changeTo = themeStore.currentThemeType == ThemeType.light
//                 ? ThemeType.dark
//                 : ThemeType.light;
//             themeStore.changeCurrentTheme(changeTo);
//           },
//           child: Text('Change Theme'),
//         ),
//       ),
//     );
//   }
// }
