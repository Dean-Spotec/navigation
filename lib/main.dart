import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/common/sp_util.dart';
import 'package:navigation/common/user_auth_guard.dart';
import 'package:navigation/common/user_auth_notifier.dart';
import 'package:provider/provider.dart';

import 'app_router.gr.dart';
import 'common/router_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.setup();
  GetIt.I.registerSingleton<AppRouter>(AppRouter(authGuard: AuthGuard()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I.get<AppRouter>();
    return CupertinoApp.router(
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [RouterObserver()],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (context) => UserAuthNotifier(),
          child: child,
        );
      },
    );
  }
}
