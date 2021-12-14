import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fleet/cubit/user.dart';
import 'package:fleet/cubit/walkers.dart';
import 'package:fleet/navigation.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/view/common/loading.dart';

class WalkerList extends StatelessWidget {
  const WalkerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalkersCubit, WalkersState>(
      builder: (context, state) {
        if (state.loadingWalkers) return const Loading(text: 'Loading Walkers');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.walkers.isEmpty)
              ...[]
            else ...[
              Row(
                children: [
                  Text(
                    'Walkers',
                    style: context.fonts.headline6,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.read<WalkersCubit>().getWalkers();
                    },
                    color: context.colours.primary,
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (state.hasLiveWalkers())
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.liveAll,
                    );
                  },
                  child: const Text(
                    'View All Live Walks',
                  ),
                ),
              for (final w in state.walkers) ...[
                if (w.isWalking) ...[
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.liveOne,
                        arguments: w,
                      );
                    },
                    child: Text(w.phone),
                  ),
                ] else
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.walker,
                        arguments: w,
                      );
                    },
                    child: Text(w.phone),
                  ),
              ],
            ],
          ],
        );
      },
    );
  }
}

class StartWalking extends StatelessWidget {
  const StartWalking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.walk);
          },
          child: const Text('Ready to Walk ?'),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state.user == null) return Container();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // const SizedBox(height: 44),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onLongPress: () {
                            Navigator.pushNamed(context, Routes.logs);
                          },
                          child: Text(
                            'Welcome,\n' + state.user!.phone,
                            style: context.fonts.headline6,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.settingss);
                          },
                          color: context.colours.primary,
                          icon: const Icon(Icons.settings),
                        ),
                      ],
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, Routes.map);
                    //   },
                    //   child: const Text('OPEN MAP'),
                    // ),
                    const SizedBox(height: 40),
                    if (state.user!.isAdmin) ...[
                      const SizedBox(height: 40),
                      const WalkerList(),
                    ] else ...[
                      const StartWalking(),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
