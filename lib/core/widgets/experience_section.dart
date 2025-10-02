import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    final timeline = [
      {
        'title': 'Senior Developer - App Development Society',
        'institution': 'City University of Sciences & Information Technology',
        'duration': 'Aug 2025 – Present',
        'description':
            'Developing multiple projects given by University and also helping and teaching junior developers.',
      },
      {
        'title': 'Mobile App Development Internship',
        'institution': 'Under Senior Developer Moiz Altaf',
        'duration': 'Feb 2025 – Aug 2025',
        'description':
            'Developed and maintained cross-platform apps using Flutter & Firebase. Applied MVVM, Firebase Auth, Firestore, Storage, AdMob.',
      },
      {
        'title': 'Freelance & Personal Projects',
        'institution': 'Self-Directed',
        'duration': '2023 – Present',
        'description':
            'Built & deployed apps like Let It Fly, PayProof, Afghan Flavors. Full lifecycle: UI/UX, development, testing, deployment. Currently working on a SaaS.',
      },
    ];

    return Padding(
      padding: isMobile ? AppPaddings.horizontal6 : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSizes.hp(3)),
          Column(
            children: timeline.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Timeline dots + line
                  Column(
                    children: [
                      Container(
                        width: AppSizes.wp(isMobile ? 3 : 2.5),
                        height: AppSizes.wp(isMobile ? 3 : 2.5),
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      if (index != timeline.length - 1)
                        Container(
                          width: 2,
                          height: AppSizes.hp(isMobile ? 10 : 16),
                          color: primaryColor.withOpacity(0.5),
                        ),
                    ],
                  ),
                  SizedBox(width: AppSizes.wp(isMobile ? 3 : 4)),

                  // Card
                  Expanded(
                    child: Container(
                      margin: AppPaddings.onlyBottom3,
                      padding: isMobile ? AppPaddings.all2 : AppPaddings.all3,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            item['title']!,
                            style: AppTextStyles.subheading.copyWith(
                              fontSize: AppSizes.sp(isMobile ? 14 : 16),
                            ),
                          ),
                          SizedBox(height: AppSizes.hp(0.5)),

                          // Institution
                          Text(
                            item['institution']!,
                            style: AppTextStyles.captionWhite.copyWith(
                              fontSize: AppSizes.sp(isMobile ? 12 : 13),
                            ),
                          ),
                          SizedBox(height: AppSizes.hp(0.5)),

                          // Duration
                          Text(
                            item['duration']!,
                            style: AppTextStyles.caption.copyWith(
                              fontSize: AppSizes.sp(isMobile ? 11 : 12),
                            ),
                          ),
                          SizedBox(height: AppSizes.hp(1)),

                          // Description
                          Text(
                            item['description']!,
                            style: AppTextStyles.body.copyWith(
                              fontSize: AppSizes.sp(isMobile ? 12 : 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
