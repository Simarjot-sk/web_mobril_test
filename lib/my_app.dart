import 'package:flutter/material.dart';
import 'package:web_mobril_test/data/shared_pref_helper.dart';
import 'package:web_mobril_test/presentation/screens/home/home_screen.dart';
import 'package:web_mobril_test/presentation/screens/home/home_state_holder.dart';
import 'package:web_mobril_test/presentation/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:web_mobril_test/presentation/screens/login/login_state_holder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final initialRoute =
        Prefs.isLoggedIn.get() ? HomeScreen.route : LoginScreen.route;
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff38ABF2)),
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
