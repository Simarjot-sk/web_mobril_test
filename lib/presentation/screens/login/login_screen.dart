import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_mobril_test/presentation/screens/home/home_screen.dart';
import 'package:web_mobril_test/presentation/screens/login/login_state_holder.dart';
import 'package:web_mobril_test/presentation/theme/colors.dart';
import 'package:web_mobril_test/ui_state.dart';

class LoginScreen extends StatefulWidget {
  static const route = "login_screen_route";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<LoginStateHolder>();
      state.addListener(() {
        final loginState = state.loginState;
        if (loginState == null) return;
        switch (loginState) {
          case Success success:
            Navigator.pushReplacementNamed(context, HomeScreen.route, arguments: success.data);
            break;
          case Failure failure:
            final snackBar = SnackBar(content: Text(failure.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            break;
          case Loading _:
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginStateHolder>();

    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'You are not logged in!',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please Login to continue',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildLoginButton(state),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(LoginStateHolder stateHolder) {
    final isLoading = stateHolder.loginState is Loading;
    return isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: () {
              stateHolder.loginWithGoogle();
            },
            child: const Text("Login With Google"),
          );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: kPrimaryColor,
    );
  }
}
