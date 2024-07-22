import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double defaultScreenWidth = 375;
double defaultScreenHeight = 812;
double screenWidth = defaultScreenWidth;
double screenHeight = defaultScreenHeight;

class ScreenSize {
  static bool initialized = false;

  static double getSize(double value) => value.h;

  //<editor-fold desc="Width Getters">
  static double get appContentPadding => getSize(20);

  static double get s0 => getSize(0);

  static double get s1 => getSize(1);

  static double get s2 => getSize(2);

  static double get s3 => getSize(3);

  static double get s4 => getSize(4);

  static double get s5 => getSize(5);

  static double get s6 => getSize(6);

  static double get s7 => getSize(7);

  static double get s8 => getSize(8);

  static double get s9 => getSize(9);

  static double get s10 => getSize(10);

  static double get s11 => getSize(11);

  static double get s12 => getSize(12);

  static double get s13 => getSize(13);

  static double get s14 => getSize(14);

  static double get s15 => getSize(15);

  static double get s16 => getSize(16);

  static double get s17 => getSize(17);

  static double get s18 => getSize(18);

  static double get s20 => getSize(20);

  static double get s21 => getSize(21);

  static double get s22 => getSize(22);

  static double get s23 => getSize(23);

  static double get s24 => getSize(24);

  static double get s25 => getSize(25);

  static double get s26 => getSize(26);

  static double get s28 => getSize(28);

  static double get s30 => getSize(30);

  static double get s32 => getSize(32);

  static double get s35 => getSize(35);

  static double get s36 => getSize(36);

  static double get s40 => getSize(40);

  static double get s42 => getSize(42);

  static double get s44 => getSize(44);

  static double get s45 => getSize(45);

  static double get s48 => getSize(48);

  static double get s50 => getSize(50);

  static double get s52 => getSize(52);

  static double get s55 => getSize(55);

  static double get s56 => getSize(56);

  static double get s60 => getSize(60);

  static double get s64 => getSize(64);

  static double get s68 => getSize(68);

  static double get s72 => getSize(72);

  static double get s76 => getSize(76);

  static double get s80 => getSize(80);

  static double get s90 => getSize(90);

  static double get s100 => getSize(100);

  static double get s120 => getSize(120);
  
  static double get s130 => getSize(130);

  static double get s140 => getSize(140);

  static double get s150 => getSize(150);

  static double get s156 => getSize(156);

  static double get s160 => getSize(160);

  static double get s165 => getSize(165);

  static double get s180 => getSize(180);

  static double get s200 => getSize(200);

  static double get s220 => getSize(220);

  static double get s230 => getSize(230);

  static double get s250 => getSize(250);

  static double get s260 => getSize(260);

  static double get s300 => getSize(300);

  static double get defaultImageHeight => s100;

  static double get defaultImageRadius => s40;

  //</editor-fold>

  /*Screen Size dependent Constants*/
  static double screenWidthHalf = screenWidth / 2;
  static double screenHeightHalf = screenHeight / 2;
  static double screenHeightThird = screenHeight / 0.6;
  static double screenWidthThird = screenWidth / 3;
  static double screenWidthFourth = screenWidth / 4;
  static double screenWidthFifth = screenWidth / 5;
  static double screenWidthSixth = screenWidth / 6;
  static double screenWidthTenth = screenWidth / 10;
  static double screenWidthTwelfth = screenWidth / 12;

  static EdgeInsets get defaultSpace => EdgeInsets.all(ScreenSize.s8);

  static EdgeInsets get smallSpace => EdgeInsets.all(ScreenSize.s10);

  static EdgeInsets get extraSmallSpace => EdgeInsets.all(ScreenSize.s5);

  static EdgeInsets get mediumSpace => EdgeInsets.all(ScreenSize.s15);

  static EdgeInsets get largeSpace => EdgeInsets.all(ScreenSize.s20);
}
