import 'package:flutter/material.dart';
import 'package:thing_toast/src/colors.dart';

/// Type of the Toast
///
/// * `Success` : For success condition
/// * `Info` : For information
/// * `Warning` : For warning condition
/// * `Error` : For error condition
enum ToastType {
  success(successColor, successGradient, Icons.check_circle),
  info(infoColor, infoGradient, Icons.lightbulb),
  warning(warningColor, warningGradient, Icons.info_rounded),
  error(errorColor, errorGradient, Icons.warning_rounded);

  final Color color;
  final IconData icon;
  final LinearGradient gradient;

  const ToastType(this.color, this.gradient, this.icon);
}
