import 'package:flutter_starter/core/app_colors.dart';
import 'package:flutter_starter/core/app_gradients.dart';
import 'package:flutter_starter/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/store/theme/theme_store.dart';

class AppBarWidget extends PreferredSize {
  final ThemeStore themeStore;

  AppBarWidget(this.themeStore)
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            // decoration: BoxDecoration(gradient: AppGradients.linear),
            decoration: BoxDecoration(
              color: themeStore.currentThemeType == ThemeType.light
                  ? AppColors.white
                  : AppColors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text('Olá, Dev', style: AppTextStyles.title,),
                    Text.rich(TextSpan(
                        text: "Ola, ",
                        style: AppTextStyles.title,
                        children: [
                          TextSpan(text: "Dev ", style: AppTextStyles.titleBold)
                        ])),
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/28840453?s=400&u=dc6e10a5508800e83c3e30bf7b13a7162fdf4707&v=4"))),
                    )
                  ],
                ),
              ]),
            ),
          ),
        );
}
