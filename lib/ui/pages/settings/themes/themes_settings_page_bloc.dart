// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:act_global_manager/act_global_manager.dart';
import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:brorum/ui/pages/settings/themes/themes_settings_page_state.dart';

/// This is the bloc of the themes settings page of the application.
class ThemesSettingsPageBloc extends BlocForMixin<ThemesSettingsPageState>
    with MixinActThemesBloc<ActThemesManager, ThemesSettingsPageState> {
  /// Class constructor
  ThemesSettingsPageBloc()
    : super(
        ThemesSettingsPageState.init(
          currentTheme: globalGetIt().get<ActThemesManager>().currentTheme,
          brightness: globalGetIt().get<ActThemesManager>().brightness,
        ),
      );
}
