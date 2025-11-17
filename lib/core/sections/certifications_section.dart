import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    final certifications = [
      {
        'title': 'Flutter & Firebase App Development',
        'issuer': 'The Digital Adda Academy',
        'date': 'Issued Jan 2024',
        'description':
            'Completed an in-depth course covering Flutter app development with Firebase integration, MVVM architecture, authentication, Firestore, and cloud storage.'
      },
      {
        'title': 'Digital Innovative Challenge KPK Participation',
        'issuer': 'WatSan Cell, Board of Khyber Pakhtunkhwa',
        'date': 'Issued Nov 2025',
        'description':
            'Developed an idea about hygene and secured 3rd position accross all universities in KPK.'
      },
      {
        'title': 'Skillathon Participation In App Development',
        'issuer': 'City University Of Sciences & Information Technology',
        'date': 'Issued Dec 2024',
        'description':
            'Participated in a university-level app development competition, building a fully functional app prototype within limited time.'
      },
      {
        'title': 'Prompt Engineering',
        'issuer': 'Great Learning',
        'date': 'Issued Jan 2025',
        'description':
            'Gained expertise in crafting effective AI prompts for various use cases including automation, chatbots, and content generation.'
      },
      {
        'title': 'Networking Essentials',
        'issuer': 'Cisco',
        'date': 'Issued May 2025',
        'description':
            'Studied the fundamentals of networking including IP addressing, subnetting, network protocols, and essential troubleshooting skills.'
      },
      {
        'title': 'HTML/CSS',
        'issuer': 'CISCO',
        'date': 'Issued Aug 2025',
        'description':
            'Learned HTML and CSS in depth, which are crucial for web development.'
      },
      {
        'title': 'Microsoft Learner Student Ambassador',
        'issuer': 'Microsoft Learner',
        'date': 'Issued May 2025',
        'description':
            'Selected as a Microsoft Student Ambassador, engaging in community events, technical workshops, and collaborative learning projects.'
      },
      {
        'title': 'Network Technician Career Path',
        'issuer': 'Cisco',
        'date': 'Issued April 2025',
        'description':
            'Completed a structured program on network installation, configuration, maintenance, and security best practices.'
      },
      {
        'title': 'Fundamentals In Digital Marketing',
        'issuer': 'Google',
        'date': 'Issued Nov 2023',
        'description':
            'Learned the core concepts of digital marketing including SEO, SEM, social media strategies, and online advertising fundamentals.'
      },
    ];

    return Padding(
      padding: isMobile ? AppPaddings.horizontal6 : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Responsive grid
          LayoutBuilder(
            builder: (context, constraints) {
              double screenWidth = constraints.maxWidth;
              int crossAxisCount;

              if (screenWidth > 1200) {
                crossAxisCount = 3; // Desktop
              } else if (screenWidth > 800) {
                crossAxisCount = 2; // Tablet
              } else {
                crossAxisCount = 1; // Mobile
              }

              double cardWidth =
                  (screenWidth / crossAxisCount) - AppSizes.wp(3);

              return Wrap(
                spacing: AppSizes.wp(3),
                runSpacing: AppSizes.hp(3),
                children: certifications.map((cert) {
                  return HoverContainer(
                    borderRadius: 12,
                    backgroundColor: secondaryColor,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: cardWidth,
                      padding: AppPaddings.all3,
                      decoration: BoxDecoration(
                        color: Colors.transparent, // handled by HoverContainer
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.05),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            cert['title'] ?? '',
                            style: AppTextStyles.subheading.copyWith(
                              fontSize: AppSizes.sp(isMobile ? 15 : 17),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: AppSizes.hp(0.8)),

                          // Issuer
                          Text(
                            cert['issuer'] ?? '',
                            style: AppTextStyles.captionWhite.copyWith(
                              fontSize: AppSizes.sp(isMobile ? 13 : 14),
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          // Date
                          Text(
                            cert['date'] ?? '',
                            style: AppTextStyles.caption.copyWith(
                              fontSize: AppSizes.sp(isMobile ? 11 : 12),
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          SizedBox(height: AppSizes.hp(1)),

                          // Description
                          Text(
                            cert['description'] ?? '',
                            style: AppTextStyles.body.copyWith(
                              fontSize: AppSizes.sp(isMobile ? 12 : 13),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

// HoverContainer widget using your stateful logic
class HoverContainer extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  final Duration duration;

  const HoverContainer({
    super.key,
    required this.child,
    this.borderRadius = 8,
    this.backgroundColor = secondaryColor,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: widget.duration,
        decoration: BoxDecoration(
          color: widget.backgroundColor.withOpacity(_hovering ? 1.0 : 0.92),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
