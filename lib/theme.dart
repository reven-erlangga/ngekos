import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color purpleColor = Color(0xff5843BE);
Color orangeColor = Color(0xffFF9376);
Color blackColor = Color(0xff000000);
Color whiteColor = Color(0xffFFFFFF);
Color grayColor = Color(0xff82868E);

const double edge = 24;

TextStyle blackTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w500, color: blackColor);

TextStyle whiteTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w500, color: whiteColor);

TextStyle grayTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w500, color: grayColor);

TextStyle purpleTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w500, color: purpleColor);

TextStyle regularTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w400, color: blackColor);
