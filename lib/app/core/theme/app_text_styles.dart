import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class AppTextStyles {
  static final heading1 = GoogleFonts.quattrocento(fontWeight: FontWeight.bold, fontSize: 28.0);
  static final heading2 = GoogleFonts.quattrocento(fontWeight: FontWeight.bold, fontSize: 26.0);
  static final heading3 = GoogleFonts.quattrocento(fontWeight: FontWeight.bold, fontSize: 24.0);
  static final heading4 = GoogleFonts.quattrocento(fontWeight: FontWeight.bold, fontSize: 22.0);
  static final heading5 = GoogleFonts.quattrocento(fontWeight: FontWeight.bold, fontSize: 20.0);
  static final heading6 = GoogleFonts.quattrocento(fontWeight: FontWeight.bold, fontSize: 18.0);

  static final title = GoogleFonts.quattrocento(fontWeight: FontWeight.bold, fontSize: 18.0);
  static final subtitle = GoogleFonts.quattrocento(fontWeight: FontWeight.bold, fontSize: 16.0, color: AppColors.subtitle);

  static final body = GoogleFonts.martel(fontSize: 16);
  static final bodyAlternative = GoogleFonts.martel(fontSize: 16, color: AppColors.bodyAlternative);
  static final link = GoogleFonts.martel(fontWeight: FontWeight.bold, fontSize: 18.0, color: AppColors.link);
}