// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/constants/graphical_constants.dart' as graphical_constants;
import 'package:brorum/types/themes/bro_themes.dart';
import 'package:brorum/ui/widgets/radios/themes/theme_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This widget is the radio group of the themes settings page of the application.
class ThemesRadioGroup extends StatelessWidget {
  /// {@template ThemeRadio.currentBrightness}
  /// The current brightness of the app.
  /// {@endtemplate}
  final Brightness currentBrightness;

  /// The currently selected theme.
  final BroThemes selectedTheme;

  /// This callback is called when the user selects a theme.
  final ValueChanged<BroThemes> onChanged;

  /// Class constructor
  const ThemesRadioGroup({
    super.key,
    required this.currentBrightness,
    required this.selectedTheme,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => RadioGroup<BroThemes>(
    groupValue: selectedTheme,
    onChanged: (value) {
      if (value == null) {
        // Nothing to do
        return;
      }
      onChanged(value);
    },
    child: Builder(
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: graphical_constants.mainHorizontalPadding.w),
        child: Wrap(
          spacing: 10.w,
          children: BroThemes.values
              .map(
                (theme) => ThemeRadio(currentBrightness: currentBrightness, displayedTheme: theme),
              )
              .toList(),
        ),
      ),
    ),
  );
}
