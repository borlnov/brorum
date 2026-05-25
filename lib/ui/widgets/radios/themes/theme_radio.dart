// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/generated/l10n.dart';
import 'package:brorum/models/ui/themes/bro_specific_colors.dart';
import 'package:brorum/types/themes/bro_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This is a radio widget used to select a theme in the themes settings page of the application.
class ThemeRadio extends StatelessWidget {
  /// The theme associated with this radio.
  final BroThemes displayedTheme;

  /// {@template ThemeRadio.currentBrightness}
  /// The current brightness of the app.
  /// {@endtemplate}
  final Brightness currentBrightness;

  /// Class constructor
  const ThemeRadio({super.key, required this.displayedTheme, required this.currentBrightness});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final actExt = themeData.extension<BroSpecificColors>()!;
    final tr = Tr.of(context);

    final groupRegistry = RadioGroup.maybeOf<BroThemes>(context);

    ThemeData? themeToDisplay;
    if (currentBrightness == Brightness.dark) {
      themeToDisplay = displayedTheme.themeData.darkThemeData;
    }

    // If the dark theme data is null, we use the light theme data.
    themeToDisplay ??= displayedTheme.themeData.lightThemeData;

    return Card(
      clipBehavior: .hardEdge,
      child: InkWell(
        onTap: () => groupRegistry?.onChanged(displayedTheme),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 12.w, top: 8.w),
          child: Column(
            mainAxisSize: .min,
            children: [
              Radio<BroThemes>(value: displayedTheme),
              if (themeToDisplay != null)
                Container(
                  clipBehavior: .hardEdge,
                  width: 200.w,
                  height: 50.w,
                  margin: EdgeInsets.only(top: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: actExt.getDisabledColor(themeData.colorScheme.outline),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    children: [
                      _buildColorElement(color: themeToDisplay.colorScheme.primary),
                      _buildColorElement(color: themeToDisplay.colorScheme.secondary),
                      _buildColorElement(color: themeToDisplay.colorScheme.tertiary),
                      _buildColorElement(color: themeToDisplay.colorScheme.surface),
                      _buildColorElement(color: themeToDisplay.colorScheme.onSurface),
                    ],
                  ),
                ),
              SizedBox(height: 8.w),
              Text(displayedTheme.getLabel(tr: tr), style: themeData.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }

  /// This method displays the given color
  Widget _buildColorElement({required Color color}) => Expanded(child: Container(color: color));
}
