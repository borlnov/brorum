// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_logger_manager/act_logger_manager.dart';
import 'package:act_router_manager/act_router_manager.dart';
import 'package:brorum/managers/routes/routes_name_helper.dart';
import 'package:brorum/types/routes/bro_routes.dart';

/// The manager builder linked to [BroRoutesManager]
class BroRoutesBuilder extends AbstractRouterBuilder<BroRoutesManager> {
  /// Class constructor
  const BroRoutesBuilder() : super(factory: BroRoutesManager.new);
}

/// The routes manager of the application
class BroRoutesManager extends AbstractRouterManager<BroRoutes> {
  /// Create the Go routes helper
  @override
  Future<AbstractRoutesHelper<BroRoutes>> createRoutesHelper(LogsHelper logsHelper) async =>
      RoutesNameHelper(initialRoute: BroRoutes.principal, logsHelper: logsHelper);
}
