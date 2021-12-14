import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fleet/api/user.dart';
import 'package:fleet/cubit/state.dart';
import 'package:fleet/navigation.dart';
import 'package:fleet/pkg/_deps.dart';
import 'package:fleet/pkg/firebase.dart';
import 'package:fleet/pkg/storage.dart';
import 'package:fleet/pkg/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeHive();
  await FirebaseAPIS().init();

  Bloc.observer = SimpleBlocObserver();

  setupDependencies(useDummies: false);
  FlutterError.onError = (details) async {
    await Sentry.captureException(
      details.exceptionAsString(),
      stackTrace: details.stack,
    );
    await FirebaseCrashlytics.instance
        .recordError(details.exception, details.stack);
  };
  runZonedGuarded(
    () async {
      await SentryFlutter.init(
        (options) {
          options.dsn = 'https://0000.ingest.sentry.io/0000';
        },
      );
      runApp(const WalkerApp());
    },
    (e, s) async {
      await Sentry.captureException(e, stackTrace: s);
      await FirebaseCrashlytics.instance.recordError(e, s);

      await locator<IUserAPI>().postIssue(
        issue: e.toString() + '\ntrace::' + s.toString(),
      );
    },
  );
}

class WalkerApp extends StatelessWidget {
  const WalkerApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver firebaseAnalytics =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return Cubits(
      child: MaterialApp(
        navigatorKey: homeNavigator,
        navigatorObservers: [
          SentryNavigatorObserver(),
          firebaseAnalytics,
        ],
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQueryData.copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        theme: derivedTheme(mainTheme()),
        onGenerateRoute: (settings) => Routes.setupRoutes(settings, context),
      ),
    );
  }
}
