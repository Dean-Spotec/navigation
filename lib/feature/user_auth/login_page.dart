// Author: Dean.Liu
// DateTime: 2023/01/05 15:28

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/app_router.gr.dart';
import 'package:navigation/common/pop_button.dart';
import 'package:navigation/common/user_auth_notifier.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    this.onLoginSuccess,
  }) : super(key: key);

  final VoidCallback? onLoginSuccess;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
        leading: PopButton(),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: () {
                context.pushRoute(const RegisterRoute());
              },
              child: const Text('Push Register'),
            ),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                final userAuthNotifier = context.read<UserAuthNotifier>();
                userAuthNotifier.isAuthenticated = true;
                context.router.root.pop();
                widget.onLoginSuccess?.call();
              },
              child: const Text('Login Success'),
            ),
          ],
        ),
      ),
    );
  }
}
