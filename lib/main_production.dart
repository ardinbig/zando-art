import 'package:zandoart/app/app.dart';
import 'package:zandoart/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
