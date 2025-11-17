import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';

class ReusableHeading extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color lineColor;
  final double lineThickness;
  final double spacing;

  const ReusableHeading({
    super.key,
    required this.text,
    this.icon,
    this.lineColor = primaryColor,
    this.lineThickness = 1,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.wp(20)),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: lineColor,
              thickness: lineThickness,
              endIndent: spacing,
            ),
          ),
          if (icon != null) ...[
            Icon(icon, color: lineColor, size: 20),
            SizedBox(width: 6),
          ],
          Text(
            text,
            style: AppTextStyles.heading.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Divider(
              color: lineColor,
              thickness: lineThickness,
              indent: spacing,
            ),
          ),
        ],
      ),
    );
  }
}
