// SPDX-FileCopyrightText: 2026 Benoit Rolandeau <borlnov.obsessio@gmail.com>
//
// SPDX-License-Identifier: Apache-2.0

import 'package:brorum/managers/bro_global_manager.dart';
import 'package:brorum/ui/main_app/main_app_ui.dart';

/// The main entry point of the application.
/// It initializes the global manager and runs the main app UI.
Future<void> main() async => BroGlobalManager.instance.runActApp(const MainAppUi());
