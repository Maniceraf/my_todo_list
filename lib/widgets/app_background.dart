import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/extensions.dart';

class AppBackground extends StatelessWidget {
  final Widget? body;
  final Widget? header;
  final double? headerHeight;

  const AppBackground({super.key, this.header, this.body, this.headerHeight});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Column(
      children: [
        Container(
          height: headerHeight,
          width: deviceSize.width,
          color: colors.primary,
          child: Center(child: header),
        ),
        Expanded(
          child: Container(
            width: deviceSize.width,
            color: colors.background,
            child: body,
          ),
        ),
      ],
    );
  }
}
