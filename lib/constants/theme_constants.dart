// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

library;

import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:brorum/models/ui/themes/bro_specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This defines the constellation theme
final appConstellationTheme = ActThemeModel(
  lightColors: const ActThemeColors(
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      primary: Color(0xFF5C7CFA),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFDDE4FF),
      onPrimaryContainer: Color(0xFF0F1B4D),

      secondary: Color(0xFF69CFC0),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFD8F7F2),
      onSecondaryContainer: Color(0xFF0C4039),

      tertiary: Color(0xFF9B8CFF),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFECE8FF),
      onTertiaryContainer: Color(0xFF251C63),

      error: Color(0xFFBA1A1A),
      onError: Colors.white,
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),

      surface: Color(0xFFF7F8FC),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF2F4FA),
      surfaceContainer: Color(0xFFECEFF7),
      surfaceContainerHigh: Color(0xFFE6EAF4),
      surfaceContainerHighest: Color(0xFFDEE3EE),

      onSurface: Color(0xFF253041),
      outline: Color(0xFF8A93A6),
      shadow: Color(0xFF000000),

      inverseSurface: Color(0xFF2A3242),
      onInverseSurface: Color(0xFFF6F7FB),
      inversePrimary: Color(0xFFB8C7FF),
    ),
    colorExtensions: BroSpecificColors(
      warning: Color(0xFFF5A524),
      onWarning: Color(0xFF3B2400),
      success: Color(0xFF3FAF72),
      onSuccess: Colors.white,
    ),
  ),
  darkColors: const ActThemeColors(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,

      primary: Color(0xFF9DB3FF),
      onPrimary: Color(0xFF15275C),
      primaryContainer: Color(0xFF253A82),
      onPrimaryContainer: Color(0xFFDDE4FF),

      secondary: Color(0xFF88E3D7),
      onSecondary: Color(0xFF073B36),
      secondaryContainer: Color(0xFF104F48),
      onSecondaryContainer: Color(0xFFD8F7F2),

      tertiary: Color(0xFFC8BDFF),
      onTertiary: Color(0xFF34297A),
      tertiaryContainer: Color(0xFF4A3CA0),
      onTertiaryContainer: Color(0xFFECE8FF),

      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),

      surface: Color(0xFF141824),
      surfaceContainerLowest: Color(0xFF0F131E),
      surfaceContainerLow: Color(0xFF181D2A),
      surfaceContainer: Color(0xFF1D2433),
      surfaceContainerHigh: Color(0xFF252D3F),
      surfaceContainerHighest: Color(0xFF2D374B),

      onSurface: Color(0xFFEDF2FF),
      outline: Color(0xFF98A3B9),
      shadow: Color(0xFF000000),

      inverseSurface: Color(0xFFEDF2FF),
      onInverseSurface: Color(0xFF202838),
      inversePrimary: Color(0xFF5C7CFA),
    ),
    colorExtensions: BroSpecificColors(
      warning: Color(0xFFFFC857),
      onWarning: Color(0xFF442B00),
      success: Color(0xFF6DD59A),
      onSuccess: Color(0xFF0D331C),
    ),
  ),
  fontFamily: "BBBReadMe",
  overrideDefaultTextTheme: _overrideDefaultTextTheme,
  overrideDefaultThemeData: _overrideDefaultThemeData,
);

/// This defines the agora nature theme
final appAgoraNatureTheme = ActThemeModel(
  lightColors: const ActThemeColors(
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      primary: Color(0xFF7BAE7F),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFD7EED8),
      onPrimaryContainer: Color(0xFF16351A),

      secondary: Color(0xFFA6B88C),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFE5EED9),
      onSecondaryContainer: Color(0xFF344022),

      tertiary: Color(0xFFB68C62),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFF2E0D0),
      onTertiaryContainer: Color(0xFF4B2F15),

      error: Color(0xFFBA1A1A),
      onError: Colors.white,
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),

      surface: Color(0xFFFAF8F4),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF5F2EC),
      surfaceContainer: Color(0xFFEFEAE3),
      surfaceContainerHigh: Color(0xFFE8E3DB),
      surfaceContainerHighest: Color(0xFFDED8CF),

      onSurface: Color(0xFF374151),
      outline: Color(0xFF9B948A),
      shadow: Color(0xFF000000),

      inverseSurface: Color(0xFF33342F),
      onInverseSurface: Color(0xFFF6F4F0),
      inversePrimary: Color(0xFFB9D9BC),
    ),
    colorExtensions: BroSpecificColors(
      warning: Color(0xFFDFA22F),
      onWarning: Color(0xFF412600),
      success: Color(0xFF4E9B63),
      onSuccess: Colors.white,
    ),
  ),
  darkColors: const ActThemeColors(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,

      primary: Color(0xFF9FD3A3),
      onPrimary: Color(0xFF1F4823),
      primaryContainer: Color(0xFF355F39),
      onPrimaryContainer: Color(0xFFD7EED8),

      secondary: Color(0xFFC4D2AE),
      onSecondary: Color(0xFF2E391E),
      secondaryContainer: Color(0xFF495438),
      onSecondaryContainer: Color(0xFFE5EED9),

      tertiary: Color(0xFFD8B28D),
      onTertiary: Color(0xFF59381B),
      tertiaryContainer: Color(0xFF7A5635),
      onTertiaryContainer: Color(0xFFF2E0D0),

      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),

      surface: Color(0xFF20251F),
      surfaceContainerLowest: Color(0xFF181C17),
      surfaceContainerLow: Color(0xFF242923),
      surfaceContainer: Color(0xFF2D332C),
      surfaceContainerHigh: Color(0xFF373E36),
      surfaceContainerHighest: Color(0xFF434A41),

      onSurface: Color(0xFFF4F5F2),
      outline: Color(0xFFA9A398),
      shadow: Color(0xFF000000),

      inverseSurface: Color(0xFFF4F5F2),
      onInverseSurface: Color(0xFF23261F),
      inversePrimary: Color(0xFF7BAE7F),
    ),
    colorExtensions: BroSpecificColors(
      warning: Color(0xFFF0C45D),
      onWarning: Color(0xFF492D00),
      success: Color(0xFF74C58A),
      onSuccess: Color(0xFF13341C),
    ),
  ),
  fontFamily: "BBBReadMe",
  overrideDefaultTextTheme: _overrideDefaultTextTheme,
  overrideDefaultThemeData: _overrideDefaultThemeData,
);

/// This defines the nordic calm theme
final appNordicCalmTheme = ActThemeModel(
  lightColors: const ActThemeColors(
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      primary: Color(0xFF6CA6A6),
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFD6EEEE),
      onPrimaryContainer: Color(0xFF123838),

      secondary: Color(0xFF8DB9C2),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFDDEEF2),
      onSecondaryContainer: Color(0xFF163740),

      tertiary: Color(0xFFA59ED4),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFECE8FA),
      onTertiaryContainer: Color(0xFF322C5D),

      error: Color(0xFFBA1A1A),
      onError: Colors.white,
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),

      surface: Color(0xFFF5F7FA),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF0F3F7),
      surfaceContainer: Color(0xFFE9EEF4),
      surfaceContainerHigh: Color(0xFFE2E8EF),
      surfaceContainerHighest: Color(0xFFD8E0E8),

      onSurface: Color(0xFF2F3745),
      outline: Color(0xFF8E98A8),
      shadow: Color(0xFF000000),

      inverseSurface: Color(0xFF2D3440),
      onInverseSurface: Color(0xFFF4F7FA),
      inversePrimary: Color(0xFFB8E2E2),
    ),
    colorExtensions: BroSpecificColors(
      warning: Color(0xFFE3A92C),
      onWarning: Color(0xFF402600),
      success: Color(0xFF4FAE83),
      onSuccess: Colors.white,
    ),
  ),
  darkColors: const ActThemeColors(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,

      primary: Color(0xFF9DD4D4),
      onPrimary: Color(0xFF1D4949),
      primaryContainer: Color(0xFF336565),
      onPrimaryContainer: Color(0xFFD6EEEE),

      secondary: Color(0xFFB2D8E0),
      onSecondary: Color(0xFF21434B),
      secondaryContainer: Color(0xFF3B6068),
      onSecondaryContainer: Color(0xFFDDEEF2),

      tertiary: Color(0xFFC8C2EE),
      onTertiary: Color(0xFF484170),
      tertiaryContainer: Color(0xFF655D91),
      onTertiaryContainer: Color(0xFFECE8FA),

      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),

      surface: Color(0xFF181D22),
      surfaceContainerLowest: Color(0xFF12161B),
      surfaceContainerLow: Color(0xFF1E242B),
      surfaceContainer: Color(0xFF232A32),
      surfaceContainerHigh: Color(0xFF2C343E),
      surfaceContainerHighest: Color(0xFF37404C),

      onSurface: Color(0xFFEEF1F4),
      outline: Color(0xFFA1ACBB),
      shadow: Color(0xFF000000),

      inverseSurface: Color(0xFFEEF1F4),
      onInverseSurface: Color(0xFF252C36),
      inversePrimary: Color(0xFF6CA6A6),
    ),
    colorExtensions: BroSpecificColors(
      warning: Color(0xFFF0C15A),
      onWarning: Color(0xFF4B2E00),
      success: Color(0xFF76D2A7),
      onSuccess: Color(0xFF143627),
    ),
  ),
  fontFamily: "BBBReadMe",
  overrideDefaultTextTheme: _overrideDefaultTextTheme,
  overrideDefaultThemeData: _overrideDefaultThemeData,
);

/// This is the default text theme override for all the themes of the application.
TextTheme _overrideDefaultTextTheme({required ThemeData baseThemeData}) =>
    baseThemeData.textTheme.copyWith(
      // This is used for all the main texts in the application
      bodyMedium: baseThemeData.textTheme.bodyMedium?.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      // This is used for the title of the parameters groups in the settings page for example.
      titleSmall: baseThemeData.textTheme.titleSmall?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      // This is used for the title of the sub pages of the principal page for example.
      headlineSmall: baseThemeData.textTheme.headlineSmall?.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    );

/// This is the default theme data override for all the themes of the application.
ThemeData _overrideDefaultThemeData({required ThemeData baseThemeData}) => baseThemeData.copyWith(
  appBarTheme: baseThemeData.appBarTheme.copyWith(
    backgroundColor: baseThemeData.colorScheme.primary,
    foregroundColor: baseThemeData.colorScheme.onPrimary,
    toolbarHeight: 56.h,
    titleSpacing: 0,
    titleTextStyle: baseThemeData.textTheme.headlineSmall?.copyWith(
      color: baseThemeData.colorScheme.onPrimary,
    ),
  ),
);
