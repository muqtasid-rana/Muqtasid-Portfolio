import 'package:flutter/material.dart';
import 'app_sizes.dart';

class AppPaddings {
  // Vertical paddings
  static EdgeInsets vertical1 = EdgeInsets.symmetric(vertical: AppSizes.hp(1));
  static EdgeInsets vertical2 = EdgeInsets.symmetric(vertical: AppSizes.hp(2));
  static EdgeInsets vertical3 = EdgeInsets.symmetric(vertical: AppSizes.hp(3));
  static EdgeInsets vertical4 = EdgeInsets.symmetric(vertical: AppSizes.hp(4));
  static EdgeInsets vertical5 = EdgeInsets.symmetric(vertical: AppSizes.hp(5));
  static EdgeInsets vertical6 = EdgeInsets.symmetric(vertical: AppSizes.hp(6));
  static EdgeInsets vertical7 = EdgeInsets.symmetric(vertical: AppSizes.hp(7));
  static EdgeInsets vertical8 = EdgeInsets.symmetric(vertical: AppSizes.hp(8));
  static EdgeInsets vertical9 = EdgeInsets.symmetric(vertical: AppSizes.hp(9));
  static EdgeInsets vertical10 =
      EdgeInsets.symmetric(vertical: AppSizes.hp(10));
  static EdgeInsets vertical11 =
      EdgeInsets.symmetric(vertical: AppSizes.hp(11));

  // Horizontal paddings
  static EdgeInsets horizontal1 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(1));
  static EdgeInsets horizontal2 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(2));
  static EdgeInsets horizontal3 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(3));
  static EdgeInsets horizontal4 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(4));
  static EdgeInsets horizontal5 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(5));
  static EdgeInsets horizontal6 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(6));
  static EdgeInsets horizontal7 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(7));
  static EdgeInsets horizontal8 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(8));
  static EdgeInsets horizontal9 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(9));
  static EdgeInsets horizontal10 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(10));
  static EdgeInsets horizontal11 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(11));
  static EdgeInsets horizontal12 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(12));
  static EdgeInsets horizontal13 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(13));
  static EdgeInsets horizontal14 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(14));
  static EdgeInsets horizontal15 =
      EdgeInsets.symmetric(horizontal: AppSizes.wp(15));

  // All-side paddings
  static EdgeInsets all1 = EdgeInsets.all(AppSizes.hp(1));
  static EdgeInsets all2 = EdgeInsets.all(AppSizes.hp(2));
  static EdgeInsets all3 = EdgeInsets.all(AppSizes.hp(3));
  static EdgeInsets all4 = EdgeInsets.all(AppSizes.hp(4));
  static EdgeInsets all5 = EdgeInsets.all(AppSizes.hp(5));
  static EdgeInsets all6 = EdgeInsets.all(AppSizes.hp(6));
  static EdgeInsets all7 = EdgeInsets.all(AppSizes.hp(7));
  static EdgeInsets all8 = EdgeInsets.all(AppSizes.hp(8));
  static EdgeInsets all9 = EdgeInsets.all(AppSizes.hp(9));

  // Custom combinations
  static EdgeInsets horizontal2Vertical1 = EdgeInsets.symmetric(
    horizontal: AppSizes.wp(2),
    vertical: AppSizes.hp(1),
  );

  // Only Top paddings
  static EdgeInsets onlyTop1 = EdgeInsets.only(top: AppSizes.hp(1));
  static EdgeInsets onlyTop2 = EdgeInsets.only(top: AppSizes.hp(2));
  static EdgeInsets onlyTop3 = EdgeInsets.only(top: AppSizes.hp(3));
  static EdgeInsets onlyTop4 = EdgeInsets.only(top: AppSizes.hp(4));
  static EdgeInsets onlyTop5 = EdgeInsets.only(top: AppSizes.hp(5));
  static EdgeInsets onlyTop6 = EdgeInsets.only(top: AppSizes.hp(6));
  static EdgeInsets onlyTop7 = EdgeInsets.only(top: AppSizes.hp(7));
  static EdgeInsets onlyTop8 = EdgeInsets.only(top: AppSizes.hp(8));
  static EdgeInsets onlyTop9 = EdgeInsets.only(top: AppSizes.hp(9));
  static EdgeInsets onlyTop10 = EdgeInsets.only(top: AppSizes.hp(10));

  // Only Bottom paddings
  static EdgeInsets onlyBottom1 = EdgeInsets.only(bottom: AppSizes.hp(1));
  static EdgeInsets onlyBottom2 = EdgeInsets.only(bottom: AppSizes.hp(2));
  static EdgeInsets onlyBottom3 = EdgeInsets.only(bottom: AppSizes.hp(3));
  static EdgeInsets onlyBottom4 = EdgeInsets.only(bottom: AppSizes.hp(4));
  static EdgeInsets onlyBottom5 = EdgeInsets.only(bottom: AppSizes.hp(5));
  static EdgeInsets onlyBottom6 = EdgeInsets.only(bottom: AppSizes.hp(6));
  static EdgeInsets onlyBottom7 = EdgeInsets.only(bottom: AppSizes.hp(7));
  static EdgeInsets onlyBottom8 = EdgeInsets.only(bottom: AppSizes.hp(8));
  static EdgeInsets onlyBottom9 = EdgeInsets.only(bottom: AppSizes.hp(9));
  static EdgeInsets onlyBottom10 = EdgeInsets.only(bottom: AppSizes.hp(10));

  /// Custom vertical padding: `AppPaddings.customVertical(5)`
  static EdgeInsets customVertical(double value) =>
      EdgeInsets.symmetric(vertical: AppSizes.hp(value));

  /// Custom horizontal padding: `AppPaddings.customHorizontal(5)`
  static EdgeInsets customHorizontal(double value) =>
      EdgeInsets.symmetric(horizontal: AppSizes.wp(value));

  /// Custom all padding: `AppPaddings.customAll(5)`
  static EdgeInsets customAll(double value) =>
      EdgeInsets.all(AppSizes.hp(value));

  /// Custom top-only padding: `AppPaddings.onlyTop(5)`
  static EdgeInsets onlyTop(double value) =>
      EdgeInsets.only(top: AppSizes.hp(value));

  /// Custom bottom-only padding: `AppPaddings.onlyBottom(5)`
  static EdgeInsets onlyBottom(double value) =>
      EdgeInsets.only(bottom: AppSizes.hp(value));

  /// Custom left-only padding: `AppPaddings.onlyLeft(5)`
  static EdgeInsets onlyLeft(double value) =>
      EdgeInsets.only(left: AppSizes.wp(value));

  /// Custom right-only padding: `AppPaddings.onlyRight(5)`
  static EdgeInsets onlyRight(double value) =>
      EdgeInsets.only(right: AppSizes.wp(value));

  /// Custom individual sides: `AppPaddings.onlyLTRB(2, 3, 4, 5)`
  static EdgeInsets onlyLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      EdgeInsets.only(
        left: AppSizes.wp(left),
        top: AppSizes.hp(top),
        right: AppSizes.wp(right),
        bottom: AppSizes.hp(bottom),
      );
  static EdgeInsets symmetric(
    double horizontal,
    double vertical,
  ) =>
      EdgeInsets.symmetric(
        horizontal: AppSizes.wp(horizontal),
        vertical: AppSizes.hp(vertical),
      );
}
