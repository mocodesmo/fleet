import 'package:flutter/material.dart';
import 'package:fleet/pkg/extensions.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext c) {
    return Column(
      children: [
        LinearProgressIndicator(
          backgroundColor: c.colours.primary,
          valueColor: AlwaysStoppedAnimation<Color>(c.colours.secondary),
        ),
        const SizedBox(height: 4),
        Text(text, style: c.fonts.caption)
      ],
    );
  }
}
