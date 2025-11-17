import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';
import 'package:muqtasid_portfolio/core/utils/hover_scale.dart';

class Workshops extends StatelessWidget {
  const Workshops({super.key});

  @override
  Widget build(BuildContext context) {
    final _workshopsAttended = [
      {
        'title': 'Microsoft Learner Administrator',
        'desc':
            'Learned about various Microsoft products and connected with people in the community',
        'images': ['assets/1.jpg'],
      },
      {
        'title': 'Google Developers Group - Firebase Studio',
        'desc':
            'Learned about Firebase Studio, Making apps with AI and connected with people in community',
        'images': ['assets/gdg3.jpg'],
      },
    ];
    return _buildProjectGrid(context, _workshopsAttended, 'assets/gdg3.jpg',
        aspectRatio: 1, type: "small");
  }

  Widget _buildProjectGrid(
    BuildContext context,
    List<Map<String, dynamic>> projects,
    String placeholderImage, {
    required double aspectRatio,
    required String type, // 'main' or 'small'
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        int crossAxisCount;

        if (type == 'main') {
          crossAxisCount = screenWidth > 900 ? 2 : 1; // 2 desktop, 1 mobile
        } else {
          if (screenWidth > 1400) {
            crossAxisCount = 6;
          } else if (screenWidth > 1000) {
            crossAxisCount = 4;
          } else if (screenWidth > 600) {
            crossAxisCount = 3;
          } else {
            crossAxisCount = 2;
          }
        }

        double cardWidth = (screenWidth / crossAxisCount) - AppSizes.wp(3);

        return Wrap(
          spacing: AppSizes.wp(3),
          runSpacing: AppSizes.hp(3),
          children: projects.map((p) {
            final images = (p['images'] as List<String>?) ?? [];
            final coverImage = images.isNotEmpty ? images[0] : placeholderImage;
            final title = p['title'] as String? ?? 'Untitled Project';
            final desc = p['desc'] as String? ?? 'No description available';

            return HoverScale(
              scale: 1.03,
              child: Container(
                width: cardWidth,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: AspectRatio(
                        aspectRatio: aspectRatio,
                        child: Image.asset(
                          coverImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(placeholderImage, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: AppPaddings.all2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: AppTextStyles.subheading
                                  .copyWith(fontSize: AppSizes.sp(15)),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          SizedBox(height: AppSizes.hp(0.5)),
                          Text(desc,
                              style: AppTextStyles.body
                                  .copyWith(fontSize: AppSizes.sp(12)),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
