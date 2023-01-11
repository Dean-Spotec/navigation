// Author: Dean.Liu
// DateTime: 2023/01/08 22:35

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:navigation/common/user_auth_guard.dart';
import 'package:navigation/common/web_view_page.dart';
import 'package:navigation/feature/asset/asset_page.dart';
import 'package:navigation/feature/asset/deposit_page.dart';
import 'package:navigation/feature/asset/record_detail_page.dart';
import 'package:navigation/feature/asset/withdraw_page.dart';
import 'package:navigation/feature/home/home_page.dart';
import 'package:navigation/feature/remote/remote_page.dart';
import 'package:navigation/feature/user_auth/login_page.dart';
import 'package:navigation/feature/user_auth/register_page.dart';
import 'package:navigation/tab_page.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CupertinoRoute(
      path: '/',
      page: TabPage,
      children: [
        CupertinoRoute(page: HomePage, initial: true),
        CupertinoRoute(page: RemotePage),
        CupertinoRoute(page: AssetPage),
      ],
    ),
    CupertinoRoute(page: WebViewPage),
    CupertinoRoute(page: DepositPage, guards: [AuthGuard]),
    CupertinoRoute(page: WithdrawPage, guards: [AuthGuard]),
    CupertinoRoute(
      page: RecordDetailPage,
      path: '/record-detail-page/:id',
      guards: [AuthGuard],
    ),
    CupertinoRoute(
      path: 'user-auth-page',
      name: 'UserAuthRoute',
      page: EmptyRouterPage,
      fullscreenDialog: true,
      children: [
        CupertinoRoute(page: LoginPage, initial: true),
        CupertinoRoute(page: RegisterPage),
      ],
    ),
  ],
)
class $AppRouter {}
