import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final String url;
  final Color color;
  final Color textColor;

  const SocialButton({
    required this.icon,
    required this.text,
    required this.url,
    required this.color,
    this.textColor = Colors.white,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ElevatedButton.icon(
          onPressed: () async {
            final uri = Uri.parse(widget.url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
          icon: FaIcon(widget.icon,
              color: widget.textColor, size: AppSizes.sp(13)),
          label: Text(
            widget.text,
            style: AppTextStyles.button.copyWith(
              fontSize: AppSizes.sp(12),
              color: widget.textColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            foregroundColor: widget.textColor,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.wp(3),
              vertical: AppSizes.hp(2),
            ),
          ),
        ),
      ),
    );
  }
}
