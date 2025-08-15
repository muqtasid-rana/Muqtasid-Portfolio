import 'package:flutter/material.dart';
import 'package:muqtasid_portfolio/constants/app_sizes.dart';
import 'package:muqtasid_portfolio/view_models/navigation_view_model.dart';
import 'package:provider/provider.dart';
import 'views/portfolio_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavigationViewModel()),
          ],
          child: Builder(
            builder: (context) {
              AppSizes.init(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const PortfolioPage(),
              );
            },
          ),
        );
      },
    );
  }
}
