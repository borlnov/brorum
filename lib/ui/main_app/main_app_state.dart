// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'dart:ui' show Brightness, Locale;

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:act_intl_ui/act_intl_ui.dart';
import 'package:act_themes_manager/act_themes_manager.dart';

/// This is the state of the MainApp widget.
class MainAppState extends BlocStateForMixin<MainAppState>
    with MixinGetWantedLocaleState<MainAppState>, MixinActThemesState<MainAppState> {
  /// {@macro act_intl_ui.MixinGetWantedLocaleState.wantedLocale}
  @override
  final Locale? wantedLocale;

  /// {@macro act_flutter_utility.MixinActThemesState.currentTheme}
  @override
  final MixinActThemes currentTheme;

  /// {@macro act_flutter_utility.MixinActThemesState.brightness}
  @override
  final Brightness? brightness;

  /// Class constructor
  const MainAppState({
    required this.wantedLocale,
    required this.currentTheme,
    required this.brightness,
  });

  /// Init class constructor
  const MainAppState.init({required this.currentTheme, required this.brightness})
    : wantedLocale = null;

  /// {@macro act_flutter_utility.BlocStateForMixin.copyWith}
  @override
  MainAppState copyWith({
    Locale? wantedLocale,
    bool forceWantedLocaleValue = false,
    MixinActThemes? currentTheme,
    Brightness? brightness,
    bool forceBrightnessValue = false,
  }) => MainAppState(
    wantedLocale: wantedLocale ?? (forceWantedLocaleValue ? null : this.wantedLocale),
    currentTheme: currentTheme ?? this.currentTheme,
    brightness: brightness ?? (forceBrightnessValue ? null : this.brightness),
  );

  /// {@macro act_intl_ui.MixinGetWantedLocaleState.copyGetWantedLocaleState}
  @override
  MainAppState copyGetWantedLocaleState({
    Locale? wantedLocale,
    bool forceWantedLocaleValue = false,
  }) => copyWith(wantedLocale: wantedLocale, forceWantedLocaleValue: forceWantedLocaleValue);

  /// {@macro act_flutter_utility.MixinActThemesState.copyActThemesState}
  @override
  MainAppState copyActThemesState({
    MixinActThemes? currentTheme,
    Brightness? brightness,
    bool forceBrightnessValue = false,
  }) => copyWith(
    currentTheme: currentTheme,
    brightness: brightness,
    forceBrightnessValue: forceBrightnessValue,
  );
}
