// Author: Dean.Liu
// DateTime: 2023/01/05 15:28

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Register')),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: () {
                context.popRoute();
              },
              child: const Text('Pop Login'),
            ),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                context.router.root.pop();
              },
              child: const Text('Pop User Auth Module'),
            )
          ],
        ),
      ),
    );
  }
}
