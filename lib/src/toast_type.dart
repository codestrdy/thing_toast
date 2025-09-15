import 'package:flutter/material.dart';
import 'package:thing_toast/src/colors.dart';

/// Type of the Toast
///
/// * `Success` : For success condition
/// * `Info` : For information
/// * `Warning` : For warning condition
/// * `Error` : For error condition
enum ToastType {
  success(successColor, successGradient),
  info(infoColor, infoGradient),
  warning(warningColor, warningGradient),
  error(errorColor, errorGradient);

  final Color color;
  final LinearGradient gradient;

  const ToastType(this.color, this.gradient);
}
