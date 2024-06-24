import 'package:brainwired_machine_test/core/themes/colors/color_pallet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: ColorPallets.bgColor,
    appBarTheme: const AppBarTheme(backgroundColor: ColorPallets.bgColor));
