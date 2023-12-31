import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle appTitle =
      GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w600);
  static TextStyle appTitle2 =
      GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600);
  static TextStyle appTitle3 =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle appSubTitle1 =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle appSubTitlebold =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle appSubTitle2 =
      GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400);
  static TextStyle appSubTitle4 =
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle appSubTitle5 =
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700);
  static TextStyle appSubTitle6 =
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w300);
  static TextStyle appSubTitle7 =
      GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400);
  static TextStyle appSubTitle3 =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle appHelpText =
      GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500);
  static TextStyle bodyMedium =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle bodyMedium3 =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w300);
  static TextStyle bodyMedium2 =
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle boldCallout = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'sfprotext');

  static TextStyle regularCallout = TextStyle(
      fontSize: Platform.isIOS ? 16 : 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'sfprotext');

  static TextStyle boldCaption01 = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');

  static TextStyle regularCaption01 = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'sfprotext');

  static TextStyle regularCaption02 = const TextStyle(
      fontSize: 11, fontWeight: FontWeight.w400, fontFamily: 'sfprotext');

  static TextStyle boldTitle01 = TextStyle(
      fontSize: Platform.isIOS ? 28 : 28,
      fontWeight: FontWeight.w700,
      fontFamily: 'sfprodisplay');

  static TextStyle boldTitle02 = TextStyle(
      fontSize: Platform.isIOS ? 22 : 22,
      fontWeight: FontWeight.w700,
      fontFamily: 'sfprodisplay');

  static TextStyle boldTitle03 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'sfprodisplay');

  static TextStyle boldBodyAndHeadline = TextStyle(
      fontSize: Platform.isIOS ? 17 : 17,
      fontWeight: FontWeight.w600,
      fontFamily: 'sfprotext');

  static TextStyle boldBodySubHeadline = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'sfprotext');

  static TextStyle regularSubHeadline = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'sfprotext');

  static TextStyle regularBody = TextStyle(
      fontSize: Platform.isIOS ? 17 : 17,
      fontWeight: FontWeight.w400,
      fontFamily: 'sfprotext');

  static TextStyle boldFootNote01 = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w600, fontFamily: 'sfprotext');

  static TextStyle regularFootNote01 = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'sfprotext');

  static TextStyle regularFootNote02 = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');
  static TextStyle regularFootNote03 = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');
  static TextStyle regularFootNote04 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');
  static TextStyle addNewMessage = const TextStyle(
      fontSize: 27, fontWeight: FontWeight.w500, fontFamily: 'sfprotext');
  static TextStyle messageTime = const TextStyle(
    fontSize: 13,
    fontFamily: 'sfprotext',
  );
  static TextStyle newMessage = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    fontFamily: 'sfprotext',
  );
}
