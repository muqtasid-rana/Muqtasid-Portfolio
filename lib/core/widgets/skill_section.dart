import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final skills = [
      {'icon': FontAwesomeIcons.mobile, 'text': 'Flutter & Dart'},
      {
        'icon': FontAwesomeIcons.database,
        'text': 'Firebase (Auth, Firestore, Storage, Functions)'
      },
      {
        'icon': FontAwesomeIcons.globe,
        'text': 'REST API Integration & Development'
      },
      {'icon': FontAwesomeIcons.layerGroup, 'text': 'MVVM Architecture'},
      {'icon': FontAwesomeIcons.paintBrush, 'text': 'UI/UX Design'},
      {'icon': FontAwesomeIcons.robot, 'text': 'AI Integration'},
      {'icon': FontAwesomeIcons.google, 'text': 'Google Ads'},
      {'icon': FontAwesomeIcons.nodeJs, 'text': 'NodeJS Basics'},
      {'icon': FontAwesomeIcons.python, 'text': 'Python Basics'},
      {'icon': FontAwesomeIcons.c, 'text': 'C++'},
      {'icon': FontAwesomeIcons.robot, 'text': 'Prompt Engineering'},
      {'icon': FontAwesomeIcons.robot, 'text': 'AI Automation Basics'},
    ];

    final tools = [
      {'icon': FontAwesomeIcons.code, 'text': 'VS Code'},
      {'icon': FontAwesomeIcons.android, 'text': 'Android Studio'},
      {'icon': FontAwesomeIcons.fire, 'text': 'Firebase Console'},
      {'icon': FontAwesomeIcons.fire, 'text': 'Firebase Studio'},
      {'icon': FontAwesomeIcons.paperPlane, 'text': 'Postman'},
      {'icon': FontAwesomeIcons.figma, 'text': 'Figma'},
      {'icon': FontAwesomeIcons.googlePlay, 'text': 'Google Play Console'},
      {'icon': FontAwesomeIcons.github, 'text': 'Git & GitHub'},
      {'icon': FontAwesomeIcons.terminal, 'text': 'Command Line'},
      {'icon': FontAwesomeIcons.robot, 'text': 'Hugging Face'},
      {'icon': FontAwesomeIcons.m, 'text': 'Make'},
    ];

    if (isMobile) {
      // 📱 Mobile: stack vertically
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildColumn('Skills', skills),
          SizedBox(height: AppSizes.hp(4)),
          _buildColumn('Tools', tools),
        ],
      );
    } else {
      // 💻 Desktop/Tablet: two columns + divider
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _buildColumn('Skills', skills)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.wp(4)),
            child: Container(
              width: 1,
              height: AppSizes.hp(25),
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Expanded(child: _buildColumn('Tools', tools)),
        ],
      );
    }
  }

  Widget _buildColumn(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.heading.copyWith(fontSize: AppSizes.sp(22)),
        ),
        SizedBox(height: AppSizes.hp(2)),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: AppSizes.wp(2),
          runSpacing: AppSizes.hp(1.5),
          children: items
              .map((item) => _SkillCard(
                    icon: item['icon'] as IconData,
                    text: item['text'] as String,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _SkillCard extends StatefulWidget {
  final IconData icon;
  final String text;

  const _SkillCard({
    required this.icon,
    required this.text,
  });

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: AppPaddings.horizontal2Vertical1,
        decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              widget.icon,
              color: primaryColor,
              size: AppSizes.sp(16),
            ),
            SizedBox(width: AppSizes.wp(2)),
            Expanded(
              child: Text(
                widget.text,
                style: AppTextStyles.body.copyWith(
                  fontSize: AppSizes.sp(13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
