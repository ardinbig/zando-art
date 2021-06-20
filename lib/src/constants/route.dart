import '../views/screens/screens.dart';

class Route {
  static const String login = '/';
  static const String category = '/category';
  static const String profile = '/profile';
  static const String orders = '/orders';

  static final routes = {
    login: (context) => LoginScreen(),
    category: (context) => CategoryScreen(),
    profile: (context) => ProfileScreen(),
    orders: (context) => OrdersScreen(),
  };
}
