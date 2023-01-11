// Author: Dean.Liu
// DateTime: 2023/01/05 18:24

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/app_router.gr.dart';
import 'package:navigation/common/user_auth_notifier.dart';
import 'package:provider/provider.dart';

import '../../common/sp_keys.dart';
import '../../common/sp_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _count = 0;

  UserAuthNotifier get _userAuthNotifier => context.read<UserAuthNotifier>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _pushLoginPageIfNeeded();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: () {
            if (_userAuthNotifier.isAuthenticated) {
              _logout();
            } else {
              context.pushRoute(const UserAuthRoute());
            }
          },
          child: const Icon(CupertinoIcons.person_alt_circle),
        ),
        middle: const Text('Home'),
        // 避免推出其他页面时因为heroTag报错
        transitionBetweenRoutes: false,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count'),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: const Text('Add Count'),
            ),
          ],
        ),
      ),
    );
  }

  void _pushLoginPageIfNeeded() {
    final isFirstLaunch =
        SpUtil.getBoolValue(SpKeys.isFirstLaunch, defaultValue: true);
    if (isFirstLaunch) {
      SpUtil.putBool(SpKeys.isFirstLaunch, false);
      context.pushRoute(const UserAuthRoute());
    }
  }

  Future<void> _logout() {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Logout'),
          content: const Text('Confirm Logout?'),
          actions: [
            CupertinoButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: CupertinoColors.systemRed),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoButton(
              child: const Text('Confirm'),
              onPressed: () {
                _userAuthNotifier.isAuthenticated = false;
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
