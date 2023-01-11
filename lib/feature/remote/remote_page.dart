// Author: Dean.Liu
// DateTime: 2023/01/11 17:09

import 'package:flutter/cupertino.dart';

import '../../common/remote_router.dart';

class RemotePage extends StatefulWidget {
  const RemotePage({Key? key}) : super(key: key);

  @override
  State<RemotePage> createState() => _HomePageState();
}

class _HomePageState extends State<RemotePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Remote'),
        // 避免推出其他页面时因为heroTag报错
        transitionBetweenRoutes: false,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: () {
                const url = 'business:///deposit-page';
                RemoteRouter.navigateTo(url);
              },
              child: const Text('Navigate To Business'),
            ),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                const url = 'https://www.baidu.com/';
                RemoteRouter.navigateTo(url);
              },
              child: const Text('Navigate To H5'),
            ),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                const url = 'sms:110&body=Hello';
                RemoteRouter.navigateTo(url);
              },
              child: const Text('Navigate To APP'),
            ),
          ],
        ),
      ),
    );
  }
}
