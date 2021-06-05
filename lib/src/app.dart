import 'package:flutter/material.dart';

import 'route.dart' as App;
import 'utils/colors.dart';

class ZandoArtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zando Art',
      theme: _buildLightTheme(),
      routes: App.Route.routes,
    );
  }

  ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: ZandoMainColor,
      primaryTextTheme: _buitTextThme(base.primaryTextTheme, ZandoMainColor),
      primaryIconTheme: base.iconTheme.copyWith(color: ZandoMainColor),
      buttonColor: ZandoMainColor,
      accentColor: ZandoBGColor,
      canvasColor: ZandoWhiteColor,
      cardColor: Colors.white,
      errorColor: ZandoErrorColor,
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),
      accentTextTheme: _buitTextThme(base.accentTextTheme, ZandoMainColor),
      textTheme: _buitTextThme(base.textTheme, ZandoMainColor),
    );
  }

  TextTheme _buitTextThme(TextTheme base, Color color) {
    return base
        .copyWith(
          headline5: base.headline6!.copyWith(fontWeight: FontWeight.w500),
          headline6: base.headline6!.copyWith(fontSize: 18.0),
          caption: base.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: color,
          bodyColor: color,
        );
  }
}
