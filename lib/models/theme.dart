// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

ColorScheme customTheme() {
  return const ColorScheme.dark().copyWith(
    background: const Color(0xff1a1c1e),
    brightness: Brightness.dark,
    error: const Color(0xffffb4ab),
    errorContainer: const Color(0xff93000a),
    inversePrimary: const Color(0xff0061a4),
    inverseSurface: const Color(0xffe2e2e6),
    onBackground: const Color(0xffe2e2e6),
    onError: const Color(0xff690005),
    onErrorContainer: const Color(0xffffb4ab),
    onInverseSurface: const Color(0xff2f3033),
    onPrimary: const Color(0xff003258),
    onPrimaryContainer: const Color(0xffd1e4ff),
    onSecondary: const Color(0xff253140),
    onSecondaryContainer: const Color(0xffd7e3f7),
    onSurface: const Color(0xffe2e2e6),
    onSurfaceVariant: const Color(0xffc3c7cf),
    onTertiary: const Color(0xff3b2948),
    onTertiaryContainer: const Color(0xfff2daff),
    outline: const Color(0xff8d9199),
    outlineVariant: const Color(0xff43474e),
    primary: const Color(0xff9ecaff),
    primaryContainer: const Color(0xff00497d),
    secondary: const Color(0xffbbc7db),
    secondaryContainer: const Color(0xff3b4858),
    shadow: const Color(0xff000000),
    surface: const Color(0xff1a1c1e),
    surfaceTint: const Color(0xff9ecaff),
    surfaceVariant: const Color(0xff43474e),
    tertiary: const Color(0xffd6bee4),
    tertiaryContainer: const Color(0xff523f5f),
  );
}

ColorScheme customLightTheme() {
  return const ColorScheme.light().copyWith(
    background: const Color(0xffffffff), // Adjusted for light background
    brightness: Brightness.light,
    error: const Color(0xffb3261e),
    errorContainer: const Color(0xffffdad4),
    inversePrimary: const Color(0xff9ecaff),
    inverseSurface: const Color(0xff2f3033),
    onBackground: const Color(0xff1a1c1e),
    onError: const Color(0xffffffff),
    onErrorContainer: const Color(0xff410002),
    onInverseSurface: const Color(0xffe2e2e6),
    onPrimary: const Color(0xffffffff),
    onPrimaryContainer: const Color(0xff001f33),
    onSecondary: const Color(0xffffffff),
    onSecondaryContainer: const Color(0xff1b2936),
    onSurface: const Color(0xff1a1c1e),
    onSurfaceVariant: const Color(0xff43474e),
    onTertiary: const Color(0xffffffff),
    onTertiaryContainer: const Color(0xff341e41),
    outline: const Color(0xff73777f),
    outlineVariant: const Color(0xffc3c7cf),
    primary: const Color(0xff0061a4),
    primaryContainer: const Color(0xffd1e4ff),
    secondary: const Color(0xff4f5d6b),
    secondaryContainer: const Color(0xffd7e3f7),
    shadow: const Color(0xff000000),
    surface: const Color(0xffffffff), // Light surface
    surfaceTint: const Color(0xff0061a4),
    surfaceVariant: const Color(0xffc3c7cf),
    tertiary: const Color(0xff6d597b),
    tertiaryContainer: const Color(0xfff2daff),
  );
}
