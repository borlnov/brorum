// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:flutter/widgets.dart' show Brightness;

/// This is the state of the themes settings page of the application.
class ThemesSettingsState extends BlocStateForMixin<ThemesSettingsState>
    with MixinActThemesState<ThemesSettingsState> {
  /// {@macro act_themes_manager.MixinActThemesState.currentTheme}
  final MixinActThemes currentTheme;

  /// {@macro act_themes_manager.MixinActThemesState.brightness}
  final Brightness? brightness;

  /// Class constructor
  const ThemesSettingsState({required this.currentTheme, required this.brightness});

  /// {@macro act_flutter_utility.BlocStateForMixin.copyWith}
  @override
  ThemesSettingsState copyWith({
    MixinActThemes? currentTheme,
    Brightness? brightness,
    bool forceBrightnessValue = false,
  }) => ThemesSettingsState(
    currentTheme: currentTheme ?? this.currentTheme,
    brightness: forceBrightnessValue ? brightness : (brightness ?? this.brightness),
  );

  /// {@macro act_themes_manager.MixinActThemesState.copyActThemesState}
  @override
  ThemesSettingsState copyActThemesState({
    MixinActThemes? currentTheme,
    Brightness? brightness,
    bool forceBrightnessValue = false,
  }) => copyWith(
    currentTheme: currentTheme,
    brightness: brightness,
    forceBrightnessValue: forceBrightnessValue,
  );
}
