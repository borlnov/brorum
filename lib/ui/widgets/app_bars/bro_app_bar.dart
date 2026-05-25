// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/constants/graphical_constants.dart' as graphical_constants;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is the app bar of the application. It is used to display the title of the page and the
/// actions of the page.
class BroAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// {@template BroAppBar.title}
  /// The title of the app bar.
  /// {@endtemplate}
  final String title;

  /// Prefered size of the app bar.
  @override
  final Size preferredSize;

  /// Class constructor
  const BroAppBar({super.key, required this.preferredSize, required this.title});

  @override
  Widget build(BuildContext context) => AppBar(
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: graphical_constants.mainHorizontalPadding.w),
      child: Text(title),
    ),
  );

  /// This is a builder of the app bar. It is used to build the app bar with the theme of the
  /// application.
  static BroAppBar builder({required BuildContext context, required String title}) {
    final themeData = Theme.of(context);

    return BroAppBar(
      preferredSize: Size.fromHeight(themeData.appBarTheme.toolbarHeight ?? kToolbarHeight),
      title: title,
    );
  }
}
