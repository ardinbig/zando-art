import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'src/app.dart';
import 'package:flutter/services.dart';
import 'package:zando_art/src/models/app_state.dart';


void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  AppState model = AppState();
  model.loadProducts();

  runApp(
    ScopedModel<AppState>(
      model: model,
      child: ZandoArtApp(),
    ),
  );
}
