// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:act_router_manager/act_router_manager.dart';

/// The routes of the application
enum BroRoutes with MixinRoute {
  /// The error page
  error,

  /// The principal page
  principal;

  /// {@macro act_router_manager.MixinRoute.parent}
  @override
  final BroRoutes? parent;

  /// {@macro act_router_manager.MixinRoute.transition}
  @override
  final RouteTransition? transition;

  /// {@macro act_router_manager.MixinRoute.screenOrientation}
  @override
  final ScreenOrientationOption? screenOrientation;

  /// [BroRoutes] constructor
  // We ignore the unused parameters as they are required by the MixinRoute but not used in this
  // project for now.
  // ignore: unused_element_parameter
  const BroRoutes({this.parent, this.transition = RouteTransition.fade, this.screenOrientation});
}
