import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mainTheme() => ThemeData(
      textTheme: GoogleFonts.workSansTextTheme(
        const TextTheme(
          button: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
          // caption: TextStyle(fontSize: 10),
          // overline: TextStyle(fontWeight: FontWeight.bold),
          // button: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      // textTheme: GoogleFonts.biryaniTextTheme(TextTheme(
      //   button: TextStyle(fontSize: 11),
      //   caption: TextStyle(fontSize: 10),
      // )),
      colorScheme: const ColorScheme(
        primary: Colors.lightBlueAccent,
        primaryVariant: Color(0xFFFFCA44),
        secondary: Color(0xFF009458),
        secondaryVariant: Color(0xFFEDF6E6),
        surface: Color(0xFFF1EFE3),
        background: Colors.white, //Color(0xFFF1EFE3),
        error: Color(0xFFFD416D),
        onPrimary: Colors.black, //Color(0xFF1E242E),
        onSecondary: Color(0xFFFCFCFC),
        onSurface: Colors.black38,
        onBackground: Colors.black54, //Color(0xFF1E242E),
        onError: Color(0xFFFAFAFA),
        brightness: Brightness.light,
      ),
    );

ThemeData derivedTheme(ThemeData theme) => theme.copyWith(
      scaffoldBackgroundColor: theme.colorScheme.background,
      inputDecorationTheme: InputDecorationTheme(
        // filled: true,
        // fillColor: theme.colorScheme.background,
        // border: OutlineInputBorder(
        //   borderSide: BorderSide.none,
        //   borderRadius: BorderRadius.circular(8),
        // ),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 12,
          primary: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          textStyle: theme.textTheme.button,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: theme.textTheme.button!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: theme.colorScheme.primary,
        elevation: 8,
        //toolbarHeight: 150,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: theme.colorScheme.secondaryVariant,
        brightness: Brightness.light,
        disabledColor: theme.colorScheme.secondaryVariant,
        labelStyle: theme.textTheme.caption!.copyWith(height: 1),
        padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
        secondaryLabelStyle: theme.textTheme.caption!.copyWith(height: 1),
        selectedColor: theme.colorScheme.secondaryVariant,
        secondarySelectedColor: theme.colorScheme.secondaryVariant,
      ),
      tabBarTheme: TabBarTheme(
        indicator: const ShapeDecoration(
          shape: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        labelColor: theme.colorScheme.error,
        unselectedLabelColor: theme.colorScheme.onPrimary,
        labelStyle: theme.textTheme.button!.copyWith(
          height: 1,
          fontWeight: FontWeight.bold,
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 24),
        unselectedLabelStyle: theme.textTheme.button!.copyWith(height: 1),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: theme.colorScheme.primary,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: theme.colorScheme.primary,
      ),
    );

// const appBarCollapsedHeight = 60.0;

const lorem =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

Duration pageInTime(int idx) => Duration(milliseconds: 300 * (idx - 1));
