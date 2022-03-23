// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color brancoEPreto;

  TextStyle get title1 => GoogleFonts.getFont(
        'Work Sans',
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Work Sans',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Work Sans',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Work Sans',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Work Sans',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Work Sans',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        fontStyle: FontStyle.normal,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Work Sans',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        fontStyle: FontStyle.italic,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFFCB997E);
  Color secondaryColor = const Color(0xFFA5A58D);
  Color tertiaryColor = const Color(0xFF6B705C);
  Color alternate = const Color(0xFFDDBEA9);
  Color primaryBackground = const Color(0xFFFFFFFF);
  Color secondaryBackground = const Color(0xFFCFCFCF);
  Color primaryText = const Color(0xFF6B705C);
  Color secondaryText = const Color(0xFFA5A58D);

  Color brancoEPreto = Color(0xFF000000);
}

class DarkModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFFCB997E);
  Color secondaryColor = const Color(0xFFA5A58D);
  Color tertiaryColor = const Color(0xFF6B705C);
  Color alternate = const Color(0xFFDDBEA9);
  Color primaryBackground = const Color(0xFF000000);
  Color secondaryBackground = const Color(0xFF1D1D1D);
  Color primaryText = const Color(0xFFFFE8D6);
  Color secondaryText = const Color(0xFFB7B7A4);

  Color brancoEPreto = Color(0xFFFFFFFF);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              height: lineHeight,
            );
}
