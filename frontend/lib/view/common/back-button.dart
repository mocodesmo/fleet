import 'package:flutter/material.dart';
import 'package:fleet/pkg/extensions.dart';

class Back extends StatelessWidget {
  const Back({
    Key? key,
    this.onTapped,
  }) : super(key: key);

  final Function? onTapped;

  @override
  Widget build(BuildContext c) {
    return GestureDetector(
      onTap: () {
        if (onTapped == null) {
          Navigator.pop(c);
          return;
        }

        onTapped!();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(width: 16),
          Icon(
            Icons.arrow_back_ios_outlined,
            size: 16,
            color: c.colours.primary,
          ),
          const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(
              'Back',
              style: c.fonts.button!.copyWith(color: c.colours.primary),
            ),
          )
        ],
      ),
    );
  }
}
