import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/extensions.dart';

class DisplayWhiteText extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;

  const DisplayWhiteText({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall?.copyWith(
        color: context.colorScheme.surface,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
