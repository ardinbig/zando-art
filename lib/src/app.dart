import 'package:flutter/material.dart';

import 'constants/route.dart' as app;
import 'constants/theme.dart';

class ZandoArtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zando Art',
      theme: ZandoArtTheme.light(),
      darkTheme: ZandoArtTheme.dark(),
      routes: app.Route.routes,
    );
  }
}
