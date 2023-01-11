// Author: Dean.Liu
// DateTime: 2023/01/10 23:44

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';

/// 流水详情页面
class RecordDetailPage extends StatefulWidget {
  const RecordDetailPage({
    Key? key,
    @pathParam required this.id,
  }) : super(key: key);

  final int id;

  @override
  State<RecordDetailPage> createState() => _RecordDetailPageState();
}

class _RecordDetailPageState extends State<RecordDetailPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Record Detail'),
      ),
      child: Center(child: Text('${widget.id}')),
    );
  }
}
