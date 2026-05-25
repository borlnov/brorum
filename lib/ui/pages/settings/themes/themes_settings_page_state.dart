// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:flutter/widgets.dart' show Brightness;

/// This is the state of the themes settings page of the application.
class ThemesSettingsPageState extends BlocStateForMixin<ThemesSettingsPageState>
    with MixinActThemesState<ThemesSettingsPageState> {
  /// {@macro act_themes_manager.MixinActThemesState.currentTheme}
  @override
  final MixinActThemes currentTheme;

  /// {@macro act_themes_manager.MixinActThemesState.brightness}
  @override
  final Brightness? brightness;

  /// Class constructor
  const ThemesSettingsPageState({required this.currentTheme, required this.brightness});

  /// Initial state constructor
  const ThemesSettingsPageState.init({required this.currentTheme, required this.brightness});

  /// {@macro act_flutter_utility.BlocStateForMixin.copyWith}
  @override
  ThemesSettingsPageState copyWith({
    MixinActThemes? currentTheme,
    Brightness? brightness,
    bool forceBrightnessValue = false,
  }) => ThemesSettingsPageState(
    currentTheme: currentTheme ?? this.currentTheme,
    brightness: forceBrightnessValue ? brightness : (brightness ?? this.brightness),
  );

  /// {@macro act_themes_manager.MixinActThemesState.copyActThemesState}
  @override
  ThemesSettingsPageState copyActThemesState({
    MixinActThemes? currentTheme,
    Brightness? brightness,
    bool forceBrightnessValue = false,
  }) => copyWith(
    currentTheme: currentTheme,
    brightness: brightness,
    forceBrightnessValue: forceBrightnessValue,
  );
}
