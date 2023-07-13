import 'package:flutter/material.dart';
import 'package:web_mobril_test/presentation/screens/home/home_screen.dart';
import 'package:web_mobril_test/presentation/screens/home/home_state_holder.dart';
import 'package:web_mobril_test/presentation/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:web_mobril_test/presentation/screens/login/login_state_holder.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isSignedIn});

  final bool isSignedIn;

  @override
  Widget build(BuildContext context) {
    final initialRoute = isSignedIn ? HomeScreen.route : LoginScreen.route;
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      routes: _createRoutes(),
    );
  }

  Map<String, WidgetBuilder> _createRoutes() {
    return {
      LoginScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => LoginStateHolder(),
            child: const LoginScreen(),
          ),
      HomeScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => HomeStateHolder(),
            child: const HomeScreen(),
          )
    };
  }
}
