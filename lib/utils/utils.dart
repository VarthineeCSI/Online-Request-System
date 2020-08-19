import 'package:flutter/material.dart';

class Utils {
  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static String dateTimeFullFormat(String t){
    String date = t.split("T")[0];
    String time = t.split("T")[1].split(".")[0];
    // Example: 2020-08-31 20:20:20
    return "$date $time";
  }
}
