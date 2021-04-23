import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_starter/core/app_colors.dart';

part 'theme_store.g.dart';

enum ThemeType { light, dark }

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final ThemeData _lightTheme =
      ThemeData.light().copyWith(primaryColor: AppColors.darkRed);
  final ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.purple,
  );

  @observable
  ThemeType currentThemeType = ThemeType.light;

  @computed
  ThemeData get currentThemeData =>
      (currentThemeType == ThemeType.light) ? _lightTheme : _darkTheme;

  @computed
  String get themeString =>
      (currentThemeType == ThemeType.light) ? 'Light' : 'Dark';

  @action
  void changeCurrentTheme(ThemeType type) {
    currentThemeType = type;
  }
}
