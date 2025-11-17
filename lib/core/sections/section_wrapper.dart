import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double maxWidth;

  const SectionWrapper({
    super.key,
    required this.child,
    this.color,
    this.maxWidth = 1200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.transparent,
      width: double.infinity,
      alignment: Alignment.center,
      padding: AppPaddings.vertical6,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
