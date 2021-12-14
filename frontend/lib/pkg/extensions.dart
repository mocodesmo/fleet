import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:hut/state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

extension ContextUtils on BuildContext {
  ColorScheme get colours => Theme.of(this).colorScheme;
  TextTheme get fonts => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  // AppLocalizations get word => AppLocalizations.of(this);

  BuildContext log(String message) {
    final words = message.split('.');
    print('ui event: ' + words.last + ' to ' + words.first);
    // logger.addEvent(message);
    return this;
  }
}

extension NullStrings on String? {
  String stringIfEmpty() {
    if (this == null) return '';
    return this!;
  }
}

extension Strings on String {
  String notLocalised() {
    //print('"' + this + '" not localised');
    return this;
  }

  String printForDebug() {
    print('STRING:: ' + this);
    return this;
  }

  String? nullIfEmpty() {
    if (this == '') return null;
    return this;
  }

  bool not(String other) => this != other;

  String nextLine() => replaceAll(' ', '\n');
}

extension Bools on bool {
  bool not(bool other) {
    return this != other;
  }
}

extension Nums on num {
  bool not(num other) {
    return this != other;
  }
}

// extension dy on dynamic {
//   Map<String, dynamic> toMap() {
//     final t = this as Map<String, dynamic>;
//     return t;
//   }
// }

class CCC {}
