// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-28
import 'package:flutter/material.dart';

class HelperColorsTemplete {
  static const Color myCustomColor = const Color.fromRGBO(0, 68, 125, 1);
  static const Color myCustomColorOpacity9 =
      const Color.fromRGBO(0, 68, 125, 0.9);
  static const Color myCustomColorOpacity8 =
      const Color.fromRGBO(0, 68, 125, 0.8);
} // HelperColorsTemplete

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const PNetworkImage(this.image, {Key key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      // errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
      fit: fit,
      width: width,
      height: height,
    );
  }
} // PNetworkImage

class PImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const PImage(this.image, {Key key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      // errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
      fit: fit,
      width: width,
      height: height,
    );
  }
} // PNe

class FormsTemplate {
  static InputDecoration textFormFieldDecoration(
      Icon _icon, String label, String hintText) {
    return InputDecoration(
      fillColor: Colors.transparent,
      border: UnderlineInputBorder(),
      filled: true,
      icon: _icon,
      hintText: hintText,
      labelText: label,
    );
  } // textFormFieldDecoration

  static InputDecoration textFormFieldNumberDecoration(String labelText) {
    return InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
      prefixText: '\฿',
      suffixText: 'THB',
      suffixStyle: TextStyle(color: Colors.green),
    );
  }

  static InputDecoration textFieldDecoration(
      String labelText, String hintText) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(),
    );
  }
} // FormsTemplate

class FormsValidate {
  static String validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }
}
