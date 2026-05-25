// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_dart_utility/act_dart_utility.dart';
import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:brorum/constants/theme_constants.dart' as theme_constants;
import 'package:brorum/generated/l10n.dart';

/// This defines the different themes of the application.
enum BroThemes with MixinStringValueType, MixinActThemes {
  /// The agora nature theme
  agoraNature(stringValueOverride: "agora_nature"),

  /// The constellation theme.
  constellation,

  /// The nordic calm theme
  nordicCalm(stringValueOverride: "nordic_calm");

  /// {@macro act_dart_utility.MixinStringValueType.stringValueOverride}
  @override
  final String? stringValueOverride;

  /// Class constructor
  const BroThemes({this.stringValueOverride});

  /// This method returns the label of the theme to display in the UI.
  String getLabel({required Tr tr}) => switch (this) {
    BroThemes.agoraNature => tr.themeLabelAgoraNature,
    BroThemes.constellation => tr.themeLabelConstellation,
    BroThemes.nordicCalm => tr.themeLabelNordicCalm,
  };

  /// {@macro act_flutter_utility.MixinActThemes.themeData}
  @override
  ActThemeModel get themeData => switch (this) {
    BroThemes.agoraNature => theme_constants.appAgoraNatureTheme,
    BroThemes.constellation => theme_constants.appConstellationTheme,
    BroThemes.nordicCalm => theme_constants.appNordicCalmTheme,
  };
}
