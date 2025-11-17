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
        'title': 'Inayat Motors Bike Shop Management System.',
        'desc':
            'A complete bike shop management system with Invoice generation system, billing, inventory, sales tracking, and customer management.',
        'images': ['assets/mockups/inayat.png'],
        'caseStudy': {
          'problem':
              'Bike shops often struggle with manual record-keeping, inaccurate stock tracking, and slow billing processes.',
          'solution':
              'Developed a full management system that automates inventory updates, billing, customer info, and sales history—making daily operations fast and accurate.',
          'techStack':
              'ReactJS, NodeJS, Flutter, Firebase Firestore, Firebase Auth, MVVM Architecture, Cloud Functions, Local Storage, PDF Generation',
          'result':
              'Successfully deployed for Inayat Motors, improving workflow speed and reducing inventory errors.'
        }
      },
      {
        'title': 'RPM Dynamics - Motorbike Shop Website',
        'desc':
            'A modern, responsive website for an automotive shop to showcase bikes, services, and contact information.',
        'images': ['assets/mockups/rpmm.png'],
        'caseStudy': {
          'problem':
              'RPM Dynamics needed an online presence to showcase their bikes and services, but they had no website to attract digital customers.',
          'solution':
              'Designed and developed a fast, SEO-optimized website with product display, service pages, and a lead-generation contact section.',
          'techStack':
              'HTML, CSS, JavaScript, Responsive Layout, SEO Optimization, Hosting on Vercel',
          'result':
              'Website successfully launched, increasing customer inquiries and improving brand credibility.'
        }
      },
      {
        'title': 'Incorpo - Automated Hiring System',
        'desc':
            'A fully automated hiring system that parses CVs, filters candidates, rate candidates accordingly and sends an automated email to selected candidate. Simplifies the recruitment process.',
        'images': ['assets/mockups/incorp.png'],
        'caseStudy': {
          'problem':
              'Companies waste hours manually reviewing CVs, filtering candidates, and managing recruitment data.',
          'solution':
              'Built an automated hiring platform that parses CVs, extracts candidate skills, ranks profile.',
          'techStack':
              'ReactJS, NodsJS, Flutter, Firebase Firebase Auth, Firestore, Cloud Functions, Python CV Parsing API, AI-based Ranking, MVVM Architecture',
          'result':
              'Currently in deployment, with automation reducing screening time by over 70%.'
        }
      },
      {
        'title': 'Let It Fly',
        'desc':
            'Anonymous emotional app with Firebase, MVVM, Ads, Notifications.',
        'images': ['assets/mockups/letitfly.png'],
        'caseStudy': {
          'problem':
              'People needed a safe space to share feelings anonymously because there is no platform that allows expressing emotions without fear of judgment.',
          'solution':
              'Built an anonymous emotional support platform where users can write, share, and connect freely without revealing their identity.',
          'techStack':
              'Flutter, MVVM Architecture, Provider, Firebase Auth, Firestore, Storage, Cloud Functions, Notifications, AI integration, Google Ads',
          'result': 'Currently in deployment process.'
        }
      },
      {
        'title': 'PayProof',
        'desc': 'Transaction saver + shareable link, MVVM, Firebase, Ads.',
        'images': ['assets/mockups/payproof.png'],
        'caseStudy': {
          'problem':
              'Users struggled to securely store and access their payment details or provide proof of transactions when needed.',
          'solution':
              'Developed a transaction proof system with shareable links so users never lose transaction details and can easily share them with anyone.',
          'techStack':
              'Flutter, MVVM Architecture, Provider, Firebase Auth, Firestore, Storage, Google Ads',
          'result': 'Currently in Early Access on PlayStore.'
        }
      },
      {
        'title': 'Muslim One',
        'desc': 'Complete Muslim Companion App',
        'images': ['assets/mockups/muslimone.png'],
        'caseStudy': {
          'problem':
              'Muslims wanted an all-in-one Islamic app for Quran, translations, audio, hadiths, prayer times, qibla direction, Islamic calendar, tasbeeh, asma-ul-husna, and more — without intrusive ads.',
          'solution':
              'Built a complete Islamic companion app with Quran, tafseer, prayer times, hadith collection, qibla finder, tasbeeh counter, Islamic calendar, asma-ul-husna, and more in a distraction-free experience.',
          'techStack':
              'Flutter, Firebase, Local Database, REST APIs, Google Ads (Banner only for Unbothered ads)',
          'result': 'Currently in Early Access on PlayStore.'
        }
      },
      {
        'title': 'Groflex Website',
        'desc': 'Website for an online services agency',
        'images': ['assets/mockups/groflex.png'],
        'caseStudy': {
          'problem': 'I wanted a website for my online agency',
          'solution':
              'Built a website for my agency with Flutter and hosted on firebase. Made the UI clean and visually appealing',
          'techStack': 'Flutter & Firebase',
          'result': 'Drove traffic to my agency'
        }
      },
      {
        'title': 'World News',
        'desc': 'News app with REST API integration, category feeds.',
        'images': ['assets/mockups/worldnews.png'],
        'caseStudy': {
          'problem':
              'Users needed a reliable source for real-time categorized news updates.',
          'solution':
              'Created a news app with REST API integration and category-based feeds to deliver real-time global updates.',
          'techStack': 'Flutter, News API, MVVM Architecture',
          'result': 'Currently in Early Access on Play Store.'
        }
      },
      {
        'title': 'Etisalat AFG Sdk API Developement',
        'desc':
            'Developed several APIs using firebase & NodeJS for Etisalat SDK',
        'images': ['assets/mockups/etisalat.png'],
        'caseStudy': {
          'problem': 'Client needed APIs to make the app work',
          'solution': 'Created as many APIs needed for client.',
          'techStack': 'Flutter, Firebase, NodeJS, MVVM Architecture',
          'result': 'Client was happy with the results'
        }
      },
      {
        'title': 'PMDC School Learning Management System UI',
        'desc': 'Learning management system interface for schools.',
        'images': ['assets/mockups/lms.png'],
        'caseStudy': {
          'problem':
              'Schools needed a modern and easy-to-use LMS interface to manage students, teachers, and classes.',
          'solution':
              'Designed and developed a complete UI for a school learning management system with dashboards, attendance, assignments, and results sections.',
          'techStack': 'Flutter, Provider (UI-focused)',
          'result': 'Provided a scalable and modern LMS UI for institutions.'
        }
      },
      {
        'title': 'Agro Mart',
        'desc': 'Grocery and agriculture marketplace app.',
        'images': ['assets/mockups/agroo.png'],
        'caseStudy': {
          'problem':
              'Farmers and customers lacked a digital marketplace to buy and sell fresh produce and groceries directly.',
          'solution':
              'Built a grocery and agriculture marketplace app where users can browse, order, and manage deliveries easily.',
          'techStack': 'Flutter, Firebase, MVVM Architecture, REST APIs',
          'result': 'Currently Working on Database.'
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
      {
        'title': 'TaskMate - Todo App',
        'desc':
            'An attractive TODO List App using RestFul APIS with CRUD operations.',
        'images': ['assets/mockups/todo.png'],
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
