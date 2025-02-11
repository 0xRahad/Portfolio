import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 1280;
  bool get isTab =>
      MediaQuery.of(this).size.width >= 900 &&
          MediaQuery.of(this).size.width < 1280;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1280;
}
