import 'package:flutter/widgets.dart';
import 'package:thing_toast/src/toast_type.dart';

/// Additional Syle for Toast
class ToastStyle {
  /// Custom Title Text Style
  final TextStyle? titleTextStyle;
  /// Custom Subtitle Text Style
  final TextStyle? subtitleTextStyle;
  /// Title Max Lines, default is `3`
  final int titleMaxLines;
  /// Subtitle Max Lines, default is `3`
  final int subtitleMaxLines;
  /// Custom Suffix Icon
  final IconData? icon;

  const ToastStyle({
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.titleMaxLines = 3,
    this.subtitleMaxLines = 3,
    this.icon,
  });
}

/// Parameter Class for Toast
class ToastParams {
  /// Toast Title
  final String title;
  /// Duration of showing Toast
  final Duration duration;
  /// Curves Animation for Toast
  final Curve curve;
  /// Toast Subtitle
  final String? subtitle;
  /// Show Suffix Icon, default is `true`
  final bool showIcon;
  /// Type of the Toast
  final ToastType type;
  /// Addintional Style for Toast
  final ToastStyle style;

  const ToastParams({
    required this.title,
    required this.duration,
    required this.curve,
    this.subtitle,
    this.showIcon = true,
    required this.type,
    this.style = const ToastStyle(),
  });
}
