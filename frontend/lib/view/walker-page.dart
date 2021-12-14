import 'package:flutter/material.dart';
import 'package:fleet/model/user.dart';
import 'package:fleet/navigation.dart';
import 'package:fleet/pkg/extensions.dart';
import 'package:fleet/view/common/back-button.dart';

class WalkerPage extends StatelessWidget {
  const WalkerPage({
    Key? key,
    required this.walker,
  }) : super(key: key);

  final User walker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Back(),
                const SizedBox(height: 40),
                Text(
                  'Walker\n' + walker.phone,
                  style: context.fonts.headline6,
                ),
                const SizedBox(height: 100),
                Text(
                  'Walks',
                  style: context.fonts.headline6,
                ),
                const SizedBox(height: 24),
                if (walker.hasWalks()) ...[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.oldOneAll,
                        arguments: walker,
                      );
                    },
                    child: const Text(
                      'View All Walks',
                    ),
                  ),
                  for (final w in walker.walks!) ...[
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.oldOne,
                          arguments: w,
                        );
                      },
                      child: Text(
                        'End Time: ' + w.endTimeStr(),
                      ),
                    )
                  ]
                ] else
                  const Text('No Walks yet')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
