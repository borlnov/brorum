// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'dart:async' show unawaited;

import 'package:act_flutter_utility/act_flutter_utility.dart';
import 'package:act_global_manager/act_global_manager.dart';
import 'package:act_intl_ui/act_intl_ui.dart';
import 'package:act_router_manager/act_router_manager.dart';
import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:brorum/managers/routes/bro_routes_manager.dart';
import 'package:brorum/types/routes/bro_routes.dart';
import 'package:brorum/ui/main_app/main_app_state.dart';

/// This is the bloc class for the main app ui.
class MainAppBloc extends BlocForMixin<MainAppState>
    with
        MixinRedirectService<BroRoutes>,
        MixinGetWantedLocaleBloc<MainAppState>,
        MixinActThemesBloc<ActThemesManager, MainAppState> {
  /// Class constructor
  MainAppBloc()
    : super(
        MainAppState.init(
          currentTheme: globalGetIt().get<ActThemesManager>().currentTheme,
          brightness: globalGetIt().get<ActThemesManager>().brightness,
        ),
      ) {
    unawaited(initRedirectService());
  }

  /// {@macro act_router_manager.MixinRedirectService.getRouterManagerFromGlobal}
  @override
  AbstractRouterManager<BroRoutes> getRouterManagerFromGlobal() =>
      globalGetIt().get<BroRoutesManager>();

  /// Close bloc method
  @override
  Future<void> close() async {
    await closeRedirectService();

    await super.close();
  }
}
