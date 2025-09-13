import 'package:flutter/widgets.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:thing_toast/src/colors.dart';

/// Type of the Toast
///
/// * `Success` : For success condition
/// * `Info` : For information
/// * `Warning` : For warning condition
/// * `Error` : For error condition
enum ToastType {
  success(successColor, successGradient, IconsaxPlusBold.tick_circle),
  info(infoColor, infoGradient, IconsaxPlusBold.lamp_on),
  warning(warningColor, warningGradient, IconsaxPlusBold.info_circle),
  error(errorColor, errorGradient, IconsaxPlusBold.close_circle);

  final Color color;
  final IconData icon;
  final LinearGradient gradient;

  const ToastType(this.color, this.gradient, this.icon);
}
