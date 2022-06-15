import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const heading = TextStyle(
    fontSize: 56.0,
    height: 1.2,
    fontWeight: FontWeight.bold,
  );
  static const h1 = TextStyle(
    fontSize: 48.0,
    height: 1.2,
    fontWeight: FontWeight.bold,
  );
  static const h2 = TextStyle(
    fontSize: 40.0,
    height: 1.2,
    fontWeight: FontWeight.bold,
  );
  static const h3 = TextStyle(
    fontSize: 32.0,
    height: 1.2,
    fontWeight: FontWeight.bold,
  );
  static const h4 = TextStyle(
    fontSize: 24.0,
    height: 1.2,
    fontWeight: FontWeight.bold,
  );
  static const h5 = TextStyle(
    fontSize: 20.0,
    height: 1.4,
    fontWeight: FontWeight.bold,
  );
  static const bodyText1 = TextStyle(
    fontSize: 16.0,
    height: 1.4,
    fontWeight: FontWeight.bold,
  );
  static const bodyText2 = TextStyle(
    fontSize: 14.0,
    height: 1.4,
  );
  static const caption = TextStyle(fontSize: 12.0);
  static const overline = TextStyle(fontSize: 10.0);
}
