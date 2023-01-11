// Author: Dean.Liu
// DateTime: 2023/01/09 16:45

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

enum LeadingType {
  back,
  close;

  bool get isBack => this == back;

  bool get isClose => this == close;
}

typedef PopButtonBuilder = Widget Function(
  BuildContext context,
  LeadingType leadingType,
  VoidCallback? action, // could be popTop, openDrawer or null
);

class PopButton extends StatefulWidget {
  final Color? color;

  final PopButtonBuilder? builder;

  const PopButton({
    Key? key,
    this.color,
    this.builder,
  })  : assert(color == null || builder == null),
        super(key: key);

  @override
  State<PopButton> createState() => _PopButtonState();
}

class _PopButtonState extends State<PopButton> {
  @override
  Widget build(BuildContext context) {
    final scope = RouterScope.of(context, watch: true);
    if (scope.controller.canPop()) {
      // 只有根page时，显示关闭，推出其他页面后显示返回按钮
      final useCloseButton = scope.controller.topMostRouter().pageCount == 1;
      if (widget.builder != null) {
        return widget.builder!(
          context,
          useCloseButton ? LeadingType.close : LeadingType.back,
          scope.controller.popTop,
        );
      }
      return useCloseButton
          ? CupertinoButton(
              onPressed: scope.controller.popTop,
              child: const Icon(CupertinoIcons.clear),
            )
          : CupertinoButton(
              onPressed: scope.controller.popTop,
              child: const Icon(CupertinoIcons.back),
            );
    }
    return const SizedBox.shrink();
  }
}
