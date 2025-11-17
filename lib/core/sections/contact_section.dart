import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: EdgeInsets.all(isMobile ? AppSizes.wp(3) : 0),
      child: Container(
        padding: isMobile ? AppPaddings.all4 : AppPaddings.all4,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              'Contact',
              style: AppTextStyles.heading.copyWith(
                fontSize: AppSizes.sp(isMobile ? 18 : 22),
              ),
            ),
            SizedBox(height: AppSizes.hp(2)),

            // Info rows
            _contactRow(FontAwesomeIcons.envelope, 'mmuqtasidrana@gmail.com',
                () => _launchURL('mailto:mmuqtasidrana@gmail.com')),
            _contactRow(FontAwesomeIcons.phone, '+92 335 9528776',
                () => _launchURL('tel:+923359528776')),
            _contactRow(
                FontAwesomeIcons.locationDot, 'Peshawar, Pakistan', null),
            SizedBox(height: AppSizes.hp(3)),

            // Social Links
            Text(
              'Find me on',
              style: AppTextStyles.subheading.copyWith(
                fontSize: AppSizes.sp(isMobile ? 14 : 16),
              ),
            ),
            SizedBox(height: AppSizes.hp(1.5)),
            Wrap(
              spacing: AppSizes.wp(1),
              runSpacing: AppSizes.hp(1.5),
              children: [
                _socialButton(
                    FontAwesomeIcons.linkedin,
                    'LinkedIn',
                    primaryColor,
                    () => _launchURL('www.linkedin.com/in/muqtasid-rana')),
                _socialButton(FontAwesomeIcons.github, 'GitHub', Colors.white,
                    () => _launchURL('https://github.com/muqtasid-rana')),
                _socialButton(
                    FontAwesomeIcons.whatsapp,
                    'WhatsApp',
                    Colors.green,
                    () => _launchURL('https://wa.me/923359528776')),
              ],
            ),

            SizedBox(height: AppSizes.hp(3)),

            // Send Email Button
            SizedBox(
              width: isMobile ? double.infinity : AppSizes.wp(25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _launchURL('mailto:mmuqtasidrana@gmail.com'),
                child: Text(
                  'Send Email',
                  style: AppTextStyles.button
                      .copyWith(fontSize: AppSizes.sp(isMobile ? 13 : 14)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactRow(IconData icon, String text, VoidCallback? onTap) {
    return Padding(
      padding: AppPaddings.onlyBottom2,
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        child: Row(
          children: [
            FaIcon(icon, color: primaryColor, size: AppSizes.sp(16)),
            SizedBox(width: AppSizes.wp(2)),
            Expanded(
              child: Text(
                text,
                style: AppTextStyles.body.copyWith(fontSize: AppSizes.sp(13)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(
      IconData icon, String label, Color color, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withOpacity(0.6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(icon, color: color, size: AppSizes.sp(14)),
              SizedBox(width: 8),
              Text(
                label,
                style: AppTextStyles.body.copyWith(
                  fontSize: AppSizes.sp(13),
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
