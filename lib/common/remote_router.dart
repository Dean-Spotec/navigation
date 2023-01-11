// Author: Dean.Liu
// DateTime: 2023/01/11 11:51

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_router.gr.dart';

class RemoteRouter {
  static navigateTo(String url) {
    debugPrint('Navigate Remote url: $url');
    final parts = url.split('://');
    final scheme = parts.first.toLowerCase();
    if (scheme == 'business') {
      final appRouter = GetIt.I.get<AppRouter>();
      appRouter.pushNamed(parts.last);
    } else if (scheme == 'https' || scheme == 'http') {
      final appRouter = GetIt.I.get<AppRouter>();
      appRouter.push(WebViewRoute(url: url));
    } else {
      // launch app etc
      final uri = Uri.tryParse(url);
      if (uri == null) return;
      canLaunchUrl(uri).then((canLaunch) {
        if (canLaunch) {
          launchUrl(uri);
        }
      });
    }
  }
}
