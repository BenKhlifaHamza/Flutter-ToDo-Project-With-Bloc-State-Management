import 'package:flutter/material.dart';

class AppSizing {
  static double heightSize(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double widthtSize(BuildContext context) =>
      MediaQuery.of(context).size.width;
}
