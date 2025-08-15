import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';
import 'package:muqtasid_portfolio/core/utils/hover_scale.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final placeholderImage = 'assets/projects/placeholder.png';

    final mainProjects = [
      {
        'title': 'Let It Fly',
        'desc':
            'Anonymous emotional app with Firebase, MVVM, Ads, Notifications.',
        'images': ['assets/mockups/letitfly.png'],
        'caseStudy': {
          'problem':
              'People needed a safe space to share feelings anonymously because there is no such platform that provides a place where people can rent out their heart without the fear of being judged',
          'solution':
              'Gave people a place to share their deep down thoughts anonymously',
          'techStack':
              'Flutter, MVVM Architecture, Provider, Firebase Auth, Firestore, Storage, Cloud Functions, Notifictions, AI integration, Google Ads',
          'result': 'Currently in deployment process.'
        }
      },
      {
        'title': 'PayProof',
        'desc': 'Transaction saver + shareable link, MVVM, Firebase, Ads.',
        'images': ['assets/mockups/payproof.png'],
        'caseStudy': {
          'problem':
              'Users struggled to store payment details and access it when needed, or keep a proof of their transaction and sending it to others.',
          'solution':
              'Created a shareable transaction proof system with Firebase backend. Where people will not lose their transection details and easily share it with anyone with a public link.',
          'techStack':
              'Flutter, MVVM Architectire, Provider, Firebase Auth, Firestore, Storage, Google Ads',
          'result': 'Currently in deployment process.'
        }
      },
      {
        'title': 'Afghan Flavors',
        'desc': 'Recipe app with API integration & category filters.',
        'images': ['assets/mockups/afghan.png'],
        'caseStudy': {
          'problem': 'Food lovers wanted easy recipe discovery with filtering.',
          'solution':
              'Built an API-based recipe explorer with category filtering, resteraunt search APIs and more.',
          'techStack': 'Flutter, REST APIs',
          'result': 'Helped real developers to implement logics'
        }
      },
      {
        'title': 'World News',
        'desc': 'News app with REST API integration, category feeds.',
        'images': ['assets/mockups/worldnews.png'],
        'caseStudy': {
          'problem': 'Users needed real-time categorized news updates.',
          'solution':
              'Created a news app with REST API and category-based feeds which shows real time updates.',
          'techStack': 'Flutter, News API, MVVM Architecture',
          'result': 'Currently in Early access on Play Store.'
        }
      },
    ];

    final smallProjects = [
      {
        'title': 'ChatNova',
        'desc':
            'A chatting app built in flutter with Firebase which shows real time messages and are able to change profile details and send messages, last seen etc.',
        'images': ['assets/mockups/chatnova.png'],
      },
      {
        'title': 'You Movies',
        'desc':
            'A movie explorer app using the YouTube API to display trailers and reviews with category search.',
        'images': ['assets/mockups/youmovies.png'],
      },
      {
        'title': 'Epic RPS Game UI',
        'desc':
            'A modern, animated Rock Paper Scissors game UI with custom graphics and smooth transitions.',
        'images': ['assets/mockups/epic.png'],
      },
      {
        'title': 'Afghan Flavours - APIs',
        'desc':
            'A recipe and cuisine app with API integration for Afghan dishes, categories, and search features.',
        'images': ['assets/mockups/afghan.png'],
      },
      {
        'title': 'Skillathon Competition Applications App',
        'desc':
            'An event application platform for Skillathon competition with submission tracking and participant features.',
        'images': ['assets/mockups/skillathon.png'],
      },
      {
        'title': 'Minimalist Notes App with CRUD',
        'desc':
            'A clean, distraction-free notes app with create, read, update, and delete functionality.',
        'images': ['assets/mockups/notes.png'],
      },
      {
        'title': 'Nike Ecommerce Store UI with Cart',
        'desc':
            'A sleek Nike store UI with product listing, detail view, and shopping cart functionality.',
        'images': ['assets/mockups/nike.png'],
      },
      {
        'title': 'WhatsApp Clone UI',
        'desc':
            'A pixel-perfect WhatsApp UI clone with chat list, message view, and status layout.',
        'images': ['assets/mockups/whatsapp.png'],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Projects

        SizedBox(height: AppSizes.hp(3)),
        _buildProjectGrid(context, mainProjects, placeholderImage,
            aspectRatio: 16 / 9, type: 'main'),

        SizedBox(height: AppSizes.hp(5)),

        // Small Projects

        SizedBox(height: AppSizes.hp(3)),
        _buildProjectGrid(context, smallProjects, placeholderImage,
            aspectRatio: 1, type: 'small'),
      ],
    );
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
              child: InkWell(
                onTap: () => _showProjectDialog(context, p, placeholderImage),
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
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: AspectRatio(
                          aspectRatio: aspectRatio,
                          child: Image.asset(
                            coverImage,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(placeholderImage,
                                    fit: BoxFit.cover),
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            SizedBox(height: AppSizes.hp(0.5)),
                            Text(desc,
                                style: AppTextStyles.body
                                    .copyWith(fontSize: AppSizes.sp(12)),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  void _showProjectDialog(
      BuildContext context, Map<String, dynamic> project, String placeholder) {
    final images = (project['images'] as List<String>?) ?? [];
    final title = project['title'] as String? ?? 'Untitled Project';
    final desc = project['desc'] as String? ?? 'No description available';
    final caseStudy = project['caseStudy'] as Map<String, String>?;
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: backgroundColor,
          insetPadding: AppPaddings.all2,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 800, // desktop max width
            ),
            child: SingleChildScrollView(
              padding: AppPaddings.all2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.heading
                        .copyWith(fontSize: AppSizes.sp(20)),
                  ),
                  SizedBox(height: AppSizes.hp(1)),
                  Text(
                    desc,
                    style:
                        AppTextStyles.body.copyWith(fontSize: AppSizes.sp(14)),
                  ),
                  SizedBox(height: AppSizes.hp(2)),
                  if (images.isNotEmpty)
                    Column(
                      children: images
                          .map(
                            (img) => Padding(
                              padding: AppPaddings.vertical2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  img,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(placeholder,
                                          fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  if (caseStudy != null) ...[
                    SizedBox(height: AppSizes.hp(2)),
                    _caseStudyBlock(
                        'Problem', caseStudy['problem'] ?? 'Not provided'),
                    _caseStudyBlock(
                        'Solution', caseStudy['solution'] ?? 'Not provided'),
                    _caseStudyBlock(
                        'Tech Stack', caseStudy['techStack'] ?? 'Not provided'),
                    _caseStudyBlock(
                        'Result', caseStudy['result'] ?? 'Not provided'),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _caseStudyBlock(String title, String content) {
    return Padding(
      padding: AppPaddings.vertical2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  AppTextStyles.subheading.copyWith(fontSize: AppSizes.sp(15))),
          SizedBox(height: AppSizes.hp(0.5)),
          Text(content,
              style: AppTextStyles.body.copyWith(fontSize: AppSizes.sp(13))),
        ],
      ),
    );
  }
}
