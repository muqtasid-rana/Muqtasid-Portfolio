import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/constants/colors.dart';
import 'package:muqtasid_portfolio/core/widgets/certifications_section.dart';
import 'package:muqtasid_portfolio/core/widgets/contact_section.dart';
import 'package:muqtasid_portfolio/constants/paddings.dart';
import 'package:muqtasid_portfolio/core/widgets/education_section.dart';
import 'package:muqtasid_portfolio/core/widgets/experience_section.dart';
import 'package:muqtasid_portfolio/core/widgets/header.dart';
import 'package:muqtasid_portfolio/core/widgets/hero_section.dart';
import 'package:muqtasid_portfolio/core/widgets/project_section.dart';
import 'package:muqtasid_portfolio/core/widgets/reusable_heading.dart';
import 'package:muqtasid_portfolio/core/widgets/section_wrapper.dart';
import 'package:muqtasid_portfolio/core/widgets/skill_section.dart';
import 'package:muqtasid_portfolio/core/widgets/workshops.dart';
import 'package:muqtasid_portfolio/view_models/navigation_view_model.dart';
import 'package:provider/provider.dart';

import '../constants/app_sizes.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool showHeader = true;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    final navVM = Provider.of<NavigationViewModel>(context, listen: false);

    navVM.scrollController.addListener(() {
      double offset = navVM.scrollController.offset;

      // Show header when scrolling up
      if (offset < lastOffset - 10) {
        setState(() => showHeader = true);
      }
      // Hide header when scrolling down
      else if (offset > lastOffset + 10) {
        setState(() => showHeader = false);
      }

      lastOffset = offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final navVM = Provider.of<NavigationViewModel>(context);

    return Scaffold(
      backgroundColor: bg,
      endDrawer: Drawer(
        backgroundColor: secondaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Menu',
                style:
                    AppTextStyles.heading.copyWith(fontSize: AppSizes.sp(20)),
              ),
            ),
            ...[
              'intro',
              'skills',
              'projects',
              'experience',
              'education',
              'certifications',
              'contact'
            ].map((section) => ListTile(
                  title: Text(
                    section.toUpperCase(),
                    style: AppTextStyles.subheading
                        .copyWith(fontSize: AppSizes.sp(14)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    navVM.scrollTo(section);
                  },
                )),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: navVM.scrollController,
            child: Column(
              children: [
                SizedBox(height: 60), // Space for floating header
                SectionWrapper(
                  key: navVM.sectionKeys['intro'],
                  child: const HeroSection(),
                ),
                ReusableHeading(text: 'Skills'),

                Padding(
                  padding: AppPaddings.symmetric(4, 3),
                  child: SectionWrapper(
                    key: navVM.sectionKeys['skills'],
                    child: const SkillsSection(),
                  ),
                ),
                ReusableHeading(text: 'Projects'),

                SectionWrapper(
                  maxWidth: 1300,
                  key: navVM.sectionKeys['projects'],
                  child: const ProjectsSection(),
                ),

                ReusableHeading(text: 'Experience'),

                SectionWrapper(
                  key: navVM.sectionKeys['experience'],
                  child: const ExperienceSection(),
                ),
                ReusableHeading(text: 'Education'),

                SectionWrapper(
                  key: navVM.sectionKeys['education'],
                  child: const EducationSection(),
                ),
                ReusableHeading(text: 'WorkShops'),

                SectionWrapper(
                  // key: navVM.sectionKeys['education'],
                  child: const Workshops(),
                ),
                Padding(
                  padding: AppPaddings.vertical4,
                  child: ReusableHeading(text: 'Certifications'),
                ),

                SectionWrapper(
                  key: navVM.sectionKeys['certifications'],
                  child: const CertificationsSection(),
                ),
                SectionWrapper(
                  key: navVM.sectionKeys['contact'],
                  child: const ContactSection(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Copyright © 2025 Muhammad Muqtasid Rana',
                    style: AppTextStyles.caption,
                  ),
                )
              ],
            ),
          ),

          // Floating Header that shows/hides
          AnimatedSlide(
            duration: const Duration(milliseconds: 250),
            offset: showHeader ? Offset.zero : const Offset(0, -1),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: showHeader ? 1 : 0,
              child: Container(
                color: backgroundColor.withOpacity(0.95),
                height: 60,
                child: const AppHeader(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
