import 'package:flutter/material.dart';
import 'package:fleet/cubit/walk.dart';
import 'package:fleet/model/walk.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/view/common/back-button.dart';

class WalkPage extends StatelessWidget {
  const WalkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkState = context.select((WalkCubit w) => w.state);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!walkState.isWalking) const Back(),
                const SizedBox(height: 100),
                if (walkState.isWalking) ...[
                  const Text('Keep Walking'),
                  const SizedBox(height: 24),
                  const CircularProgressIndicator(),
                  const SizedBox(height: 80),
                  TextButton(
                    onPressed: () {
                      context.read<WalkCubit>().stopWalk();
                    },
                    child: const Text('Stop Walking'),
                  )
                ] else ...[
                  const SizedBox(height: 32),
                  if (!walkState.startingWalk)
                    TextButton(
                      onPressed: () {
                        context.read<WalkCubit>().startWalk();
                      },
                      child: const Text('Start Walking'),
                    )
                ],
                const SizedBox(height: 100),
                if (walkState.errSocket != '') Text(walkState.errSocket),
                if (walkState.errWalking != '') Text(walkState.errWalking),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
