// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_global_manager/act_global_manager.dart';
import 'package:act_intl/act_intl.dart';
import 'package:act_licenses_manager/act_licenses_manager.dart';
import 'package:act_logger_manager/act_logger_manager.dart';
import 'package:act_platform_manager/act_platform_manager.dart';
import 'package:act_themes_manager/act_themes_manager.dart';
import 'package:brorum/generated/l10n.dart';
import 'package:brorum/managers/bro_config_manager.dart';
import 'package:brorum/managers/bro_properties_manager.dart';
import 'package:brorum/managers/routes/bro_routes_manager.dart';
import 'package:brorum/types/themes/bro_themes.dart';

/// This is the global manager for the brorum application.
class BroGlobalManager extends AbsUiGlobalManager {
  /// Instance getter for the [BroGlobalManager]
  static BroGlobalManager get instance {
    if (AbsGlobalManager.instance == null) {
      AbsGlobalManager.setInstance = BroGlobalManager._create();
    }

    return AbsGlobalManager.instance! as BroGlobalManager;
  }

  /// Class constructor
  BroGlobalManager._create() : super.create();

  /// {@macro act_global_manager.AbsGlobalManager.registerManagers}
  @override
  Future<void> registerManagers() async {
    registerManagerAsync<PlatformManager>(const PlatformBuilder());
    registerManagerAsync<BroConfigManager>(const BroConfigBuilder());
    registerManagerAsync<LoggerManager>(ExtDefaultLoggerBuilder<BroConfigManager>());
    registerManagerAsync<BroPropertiesManager>(const BroPropertiesBuilder());
    registerManagerAsync<LocalesManager>(
      LocalesManagerBuilder<BroConfigManager, BroPropertiesManager>(
        getSupportedLocales: () => Tr.delegate.supportedLocales,
      ),
    );
    registerManagerAsync<ActThemesManager>(
      ActThemesBuilder<BroConfigManager, BroPropertiesManager>(appThemes: BroThemes.values),
    );
    registerManagerAsync<ActLicensesManager>(ActLicensesBuilder<BroConfigManager>());
    registerManagerAsync<BroRoutesManager>(const BroRoutesBuilder());
  }
}
