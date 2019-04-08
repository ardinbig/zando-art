import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zando_art/src/screens/sign_in_screen.dart';
import '../src/screens/login_screen.dart';
import '../src/screens/category_screen.dart';
import '../src/screens/home_screen.dart';
import '../src/supplementals/colors.dart';

class ZandoArtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zando Art',
      home: LoginScreen(),
      initialRoute: '/',
    );
  }

  ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: ZandoMainColor,
      primaryTextTheme: _buitTextThme(base.primaryTextTheme, ZandoMainColor),
      primaryIconTheme: base.iconTheme.copyWith(color: ZandoMainColor),
      buttonColor: ZandoMainColor,
      accentColor: ZandoMainColor,
      scaffoldBackgroundColor: ZandoWhiteColor,
      cardColor: Colors.white,
      textSelectionHandleColor: ZandoMainColor,
      errorColor: ZandoErrorColor,
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
      ),
      textSelectionColor: ZandoMainColor,
      accentTextTheme: _buitTextThme(base.accentTextTheme, ZandoMainColor),
      textTheme: _buitTextThme(base.textTheme, ZandoMainColor),
    );
  }

  TextTheme _buitTextThme(TextTheme base, Color color) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontWeight: FontWeight.w500,
      ),
      title: base.title.copyWith(fontSize: 18.0),
      caption: base.caption.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    ).apply(
      fontFamily: 'Rubik',
      displayColor: color,
      bodyColor: color,
    );
  }
}
