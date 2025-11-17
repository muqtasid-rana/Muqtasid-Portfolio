import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/constants/app_text_styles.dart';
import 'package:muqtasid_portfolio/view_models/navigation_view_model.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final navVM = Provider.of<NavigationViewModel>(context, listen: false);
    final menuItems = [
      'intro',
      'skills',
      'projects',
      'experience',
      'education',
      'achievements',
      'contact'
    ];
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.wp(4),
        vertical: AppSizes.hp(2),
      ),
      color: backgroundColor.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Muqtasid.', style: AppTextStyles.heading),
          if (!isMobile)
            Row(
              children: menuItems
                  .map(
                    (item) => InkWell(
                      onTap: () => navVM.scrollTo(item),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSizes.wp(2)),
                        child: Text(
                          item.toUpperCase(),
                          style: AppTextStyles.subheading
                              .copyWith(fontSize: AppSizes.sp(13)),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          else
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
        ],
      ),
    );
  }
}
