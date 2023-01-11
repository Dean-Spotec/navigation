// Author: Dean.Liu
// DateTime: 2023/01/06 18:31

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/app_router.gr.dart';
import 'package:navigation/common/user_auth_notifier.dart';
import 'package:provider/provider.dart';

class AssetPage extends StatelessWidget {
  const AssetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Asset'),
        // 避免推出其他页面时因为heroTag报错
        transitionBetweenRoutes: false,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserAuthNotifier>(builder: (context, notifier, child) {
              return Offstage(
                offstage: !notifier.isAuthenticated,
                child: const Text('Balance: 888888.88'),
              );
            }),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                context.pushRoute(const DepositRoute());
              },
              child: const Text('Push Deposit'),
            ),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                context.pushRoute(const WithdrawRoute());
              },
              child: const Text('Push Withdraw'),
            ),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                // context.pushRoute(RecordDetailRoute(id: 1));
                context.navigateNamedTo('/record-detail-page/2');
              },
              child: const Text('Push Record Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
