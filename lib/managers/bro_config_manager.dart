// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_config_manager/act_config_manager.dart';
import 'package:act_global_manager/act_global_manager.dart';
import 'package:act_intl/act_intl.dart';
import 'package:act_themes_manager/act_themes_manager.dart';

/// Builder of the [BroConfigBuilder]
class BroConfigBuilder extends AbstractConfigBuilder<BroConfigManager> {
  /// Class constructor
  const BroConfigBuilder() : super(BroConfigManager.new);
}

/// ConfigManager of the project
///
/// This is a placeholder for future configuration options.
/// Add configuration variables here as needed.
class BroConfigManager extends AbsUsualConfigManager with MixinLocaleConfig, MixinThemesConfig {
  // Add configuration variables here as the project evolves.
  // Example:
  // final serverHostname = const ConfigVar<String>("server.hostname");
  // final serverPort = const ConfigVar<int>("server.port");

  /// Class constructor
  BroConfigManager() : super(logger: appLogger());
}
