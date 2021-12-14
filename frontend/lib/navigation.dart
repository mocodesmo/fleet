import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fleet/api/user.dart';
import 'package:fleet/api/walk.dart';
import 'package:fleet/cubit/become-admin.dart';
import 'package:fleet/cubit/walk-tracking.dart';
import 'package:fleet/cubit/walk.dart';
import 'package:fleet/cubit/walkers.dart';
import 'package:fleet/pkg/_deps.dart';
import 'package:fleet/model/user.dart';
import 'package:fleet/model/walk.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/pkg/location.dart';
import 'package:fleet/pkg/storage.dart';
import 'package:fleet/cubit/state.dart';
import 'package:fleet/view/home-page.dart';
import 'package:fleet/view/logger-page.dart';
import 'package:fleet/view/login-page.dart';
import 'package:fleet/view/maps/live-all.dart';
import 'package:fleet/view/maps/live-one.dart';
import 'package:fleet/view/maps/old-one-all.dart';
import 'package:fleet/view/maps/old-one.dart';
import 'package:fleet/view/settings-page.dart';
import 'package:fleet/view/walk-page.dart';
import 'package:fleet/view/walker-page.dart';

final homeNavigator = GlobalKey<NavigatorState>();

class Routes {
  static const home = '/';
  static const homeMain = 'home-main';
  static const settingss = 'settings';
  static const walker = 'walker';
  static const walk = 'walk';
  static const oldOne = 'track-old';
  static const oldOneAll = 'old-one-all';
  static const liveOne = 'track-live';
  static const liveAll = 'live-all';

  static const logs = 'logs';

  static const map = 'map';

  static Route<dynamic>? setupRoutes(
    RouteSettings settings,
    BuildContext context,
  ) {
    late Widget page;

    switch (settings.name) {
      case home:
        // page = TestMap();

        page = const LoginPage();
        break;

      case homeMain:
        final walkersCubit = WalkersCubit(
          locator<IUserAPI>(),
          logger,
          locator<IStorage>(),
          userCubit,
        );
        page = BlocProvider.value(
          value: walkersCubit,
          child: const HomePage(),
        );
        break;

      case settingss:
        final becomeAdminCubit = BecomeAdminCubit(
          locator<IUserAPI>(),
          locator<IStorage>(),
          logger,
        );
        page = BlocProvider.value(
          value: becomeAdminCubit,
          child: const SettingsPage(),
        );
        break;

      case walker:
        final walker = settings.arguments! as User;

        page = WalkerPage(walker: walker);
        break;

      case walk:
        final walkCubit = WalkCubit(
          locator<IStorage>(),
          logger,
          locator<IWalkAPI>(),
          locator<ILocation>(),
        );

        page = BlocProvider.value(
          value: walkCubit,
          child: const WalkPage(),
        );
        break;

      case oldOneAll:
        final user = settings.arguments! as User;
        page = MapOldAll(user: user);
        break;

      case oldOne:
        final walk = settings.arguments! as Walk;
        page = MapOldOne(walk: walk);
        break;

      case liveOne:
        final walker = settings.arguments! as User;

        final trackCubit = WalkTrackingCubit(
          walker.id.id,
          locator<IStorage>(),
          logger,
          locator<IWalkAPI>(),
          null,
        );
        page = BlocProvider.value(
          value: trackCubit,
          child: const LiveTrack(),
        );

        break;

      case liveAll:
        final walkersCubit = WalkersCubit(
          locator<IUserAPI>(),
          logger,
          locator<IStorage>(),
          userCubit,
        );

        final trackCubit = WalkTrackingCubit(
          null,
          locator<IStorage>(),
          logger,
          locator<IWalkAPI>(),
          walkersCubit,
        );

        page = MultiBlocProvider(
          providers: [
            BlocProvider.value(value: walkersCubit),
            BlocProvider.value(value: trackCubit),
          ],
          child: const LiveAll(),
        );
        break;

      case map:
        // page = const TestMap();
        break;

      case logs:
        page = BlocProvider.value(
          value: logger,
          child: const LogPage(),
        );
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return CupertinoPageRoute(
      builder: (context) {
        return page;
      },
    );
  }
}
