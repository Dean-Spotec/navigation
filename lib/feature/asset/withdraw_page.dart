// Author: Dean.Liu
// DateTime: 2023/01/10 11:03

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/app_router.gr.dart';

/// 出金页面
class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Withdraw'),
      ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () {
            context.navigateTo(const TabRoute());
          },
          child: const Text('Pop To Home'),
        ),
      ),
    );
  }
}
