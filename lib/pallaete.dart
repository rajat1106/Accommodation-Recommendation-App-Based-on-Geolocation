import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const TextStyle kBodyText =
    TextStyle(fontSize: 22, color: Colors.white, height: 1.5);

const Color kWhite = Colors.white;
const Color kBlue = Color(0xff5663ff);
const Color kGreen = Color(0xff4caf50);
const Color kMoon = Color(0xff1a237e);
const Color kTeal = Color(0xff009688);



class Palette { 
  static const MaterialColor kToDark = const MaterialColor( 
    0xff1a237e, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
    const <int, Color>{ 
      50: const Color(0xff1a237e),//10% 
      100: const Color(0xff1a237e),//20% 
      200: const Color(0xff1a237e),//30% 
      300: const Color(0xff1a237e),//40% 
      400: const Color(0xff1a237e),//50% 
      500: const Color(0xff1a237e),//60% 
      600: const Color(0xff451c16),//70% 
      700: const Color(0xff2e130e),//80% 
      800: const Color(0xff1a237e),//90% 
      900: const Color(0xff000000),//100% 
    }, 
  ); 
} // you can