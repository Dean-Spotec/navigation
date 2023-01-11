// Author: Dean.Liu
// DateTime: 2023/01/07 16:25

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

/// 入金页面
class DepositPage extends StatefulWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Deposit'),
      ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () {
            context.popRoute();
          },
          child: const Text('Pop To Asset'),
        ),
      ),
    );
  }
}
