import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muqtasid_portfolio/core/widgets/social_buttons.dart';
import 'package:muqtasid_portfolio/view_models/navigation_view_model.dart';
import 'package:provider/provider.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppPaddings.onlyLTRB(2, 5, 2, 6),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = MediaQuery.of(context).size.width < 800;

          return Stack(
            children: [
              // Background
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/blue1-min.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Blur
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(color: Colors.black.withOpacity(0.3)),
                ),
              ),

              // Foreground
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? AppSizes.wp(4) : AppSizes.wp(8),
                    vertical: isMobile ? AppSizes.hp(4) : AppSizes.hp(10),
                  ),
                  child: isMobile
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: _buildContent(context, isMobile),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildContent(context, isMobile),
                        ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildContent(BuildContext context, bool isMobile) {
    final navVM = Provider.of<NavigationViewModel>(context, listen: false);

    return [
      // Profile Image
      Container(
        margin: isMobile ? AppPaddings.onlyBottom4 : AppPaddings.onlyRight(5),
        child: CircleAvatar(
          radius: AppSizes.wp(isMobile ? 25 : 12),
          backgroundColor: bg,
          backgroundImage: const AssetImage('assets/muqtasid.png'),
        ),
      ),

      // Text + Buttons
      Flexible(
        flex: isMobile ? 0 : 1,
        child: Column(
          crossAxisAlignment:
              isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Muhammad Muqtasid Rana",
              style: AppTextStyles.heading.copyWith(
                fontSize: AppSizes.sp(isMobile ? 22 : 28),
              ),
            ),
            Padding(
              padding: AppPaddings.vertical2,
              child: Text(
                "Software Engineer | Flutter Apps Developer | Firebase Specialist",
                style: AppTextStyles.subheading.copyWith(
                  fontSize: AppSizes.sp(isMobile ? 14 : 18),
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
            ),
            Text(
              "I’m a passionate Flutter developer with expertise in Firebase, building high-performance cross-platform applications. My focus is on clean architecture (MVVM), responsive UI/UX, and delivering modern digital experiences.",
              style: AppTextStyles.body.copyWith(
                fontSize: AppSizes.sp(isMobile ? 12 : 14),
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
            ),
            SizedBox(height: AppSizes.hp(3)),

            // Social Buttons
            Wrap(
              spacing: AppSizes.wp(2),
              children: [
                Wrap(
                  spacing: AppSizes.wp(2),
                  children: [
                    SocialButton(
                      icon: FontAwesomeIcons.linkedin,
                      text: "LinkedIn",
                      url: 'https://www.linkedin.com/in/muqtasid-rana',
                      color: const Color(0xFF0077B5),
                    ),
                    SocialButton(
                      icon: FontAwesomeIcons.github,
                      text: "GitHub",
                      url: 'https://github.com/muqtasid-rana',
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ];
  }
}

// Normal hover button
class _HoverButton extends StatefulWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onPressed;

  const _HoverButton({
    required this.text,
    required this.color,
    required this.textColor,
    this.borderColor,
    required this.onPressed,
  });

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.color,
            foregroundColor: widget.textColor,
            side: widget.borderColor != null
                ? BorderSide(color: widget.borderColor!, width: 1.5)
                : null,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.wp(5),
              vertical: AppSizes.hp(1.8),
            ),
          ),
          child: Text(
            widget.text,
            style: AppTextStyles.button.copyWith(
              fontSize: AppSizes.sp(14),
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }
}

// Social Icon Button
class _SocialButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final Color color;

  const _SocialButton({
    required this.icon,
    required this.url,
    required this.color,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedScale(
          scale: _hovering ? 1.1 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: CircleAvatar(
            radius: AppSizes.wp(5),
            backgroundColor: widget.color.withOpacity(0.1),
            child: FaIcon(
              widget.icon,
              color: widget.color,
              size: AppSizes.sp(20),
            ),
          ),
        ),
      ),
    );
  }
}
