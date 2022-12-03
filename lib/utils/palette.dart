import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor primary = const MaterialColor(
    0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xff400200),//10%
      100: const Color(0xff670600),//20%
      200: const Color(0xff900c00),//30%
      300: const Color(0xffbd1300),//40%
      400: const Color(0xfffd3117),//50%
      500: const Color(0xffff553c),//60%
      600: const Color(0xffff8a75),//70%
      700: const Color(0xffffb4a6),//80%
      800: const Color(0xffffdad4),//90%
      900: const Color(0xffffffff),//100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.