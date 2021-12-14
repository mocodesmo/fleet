import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fleet/api/user.dart';
import 'package:fleet/cubit/logger.dart';
import 'package:fleet/cubit/login.dart';
import 'package:fleet/cubit/server.dart';
import 'package:fleet/cubit/user.dart';
import 'package:fleet/cubit/walkers.dart';
import 'package:fleet/pkg/_deps.dart';
import 'package:fleet/navigation.dart';
import 'package:fleet/pkg/clipboard.dart';
import 'package:fleet/pkg/firebase.dart';
import 'package:fleet/pkg/storage.dart';

final userCubit = UserCubit(
  locator<IStorage>(),
  locator<IAuthGateway>(),
  locator<IUserAPI>(),
  logger,
);

final loginCubit = PhoneLoginCubit(
  locator<IAuthGateway>(),
  locator<IStorage>(),
  logger,
);

final serverCubit = ServerCubit(
  locator<IStorage>(),
  locator<IClipBoard>(),
);

Logger logger = Logger(
  locator<IClipBoard>(),
);

class Cubits extends StatelessWidget {
  const Cubits({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: userCubit),
        BlocProvider.value(value: serverCubit),
        BlocProvider.value(value: loginCubit),
      ],
      child: BlocListener<UserCubit, UserState>(
        listenWhen: (previous, current) =>
            previous.authenticated != current.authenticated ||
            ((current.user != null || previous.user != null) &&
                previous.user != current.user),
        listener: (context, state) async {
          if (state.authenticated && state.errorOnGet == '') {
            if (state.user == null) return;

            // await Future.delayed(const Duration(seconds: 2));

            homeNavigator.currentState!.pushReplacementNamed(Routes.homeMain);

            // if (state.user!.isAdmin) context.read<WalkersCubit>().getWalkers();
          } else {
            homeNavigator.currentState!.pushReplacementNamed(Routes.home);
          }
        },
        child: BlocListener<PhoneLoginCubit, PhoneLoginState>(
          listenWhen: (previous, current) =>
              previous.loggedIn != current.loggedIn,
          listener: (context, state) {
            if (state.loggedIn) {
              context.read<PhoneLoginCubit>().reset();
              context.read<UserCubit>().getUser();
            }
          },
          child: child,
        ),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    print('Event { ' + event.toString() + ' }');

    super.onEvent(bloc, event);
  }

  //@override
  //void onChange(Cubit cubit, Change change) {
  //  super.onChange(cubit, change);
  //}

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
