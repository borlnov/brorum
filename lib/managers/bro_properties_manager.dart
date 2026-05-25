// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_intl/act_intl.dart';
import 'package:act_local_storage_manager/act_local_storage_manager.dart';
import 'package:act_themes_manager/act_themes_manager.dart';

/// This is the builder for the properties manager of brorum project
class BroPropertiesBuilder extends AbstractPropertiesBuilder<BroPropertiesManager> {
  /// Class constructor
  const BroPropertiesBuilder() : super(BroPropertiesManager.new);
}

/// This is the properties manager for needleless project
class BroPropertiesManager extends AbstractPropertiesManager
    with MixinLocaleProperties, MixinThemesProperties {}
