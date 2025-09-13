import 'package:flutter/material.dart';
import 'package:thing_toast/src/toast_params.dart';
import 'package:thing_toast/src/toast_type.dart';
import 'package:thing_toast/src/toast_wrapper.dart';

/// Class To Call Toast
class ThingToast {
  final BuildContext context;

  ThingToast(this.context);

  final List<ToastParams> _queue = [];

  bool _isShowing = false;

  /// Function to enqueue toast
  void _enqueue(ToastParams toast) {
    _queue.add(toast);

    if (!_isShowing) {
      _showOverlay();
    }
  }

  /// Function to show toast in overlay
  void _showOverlay() {
    if (_queue.isEmpty) {
      _isShowing = false;
      return;
    }

    _isShowing = true;

    final params = _queue.removeAt(0);

    OverlayEntry? overlay;

    overlay = OverlayEntry(
      builder: (context) {
        return ToastWrapper(
          title: params.title,
          duration: params.duration,
          curve: params.curve,
          showIcon: params.showIcon,
          subtitle: params.subtitle,
          onDismiss: () {
            overlay?.remove();
            overlay = null;

            _showOverlay();
          },
          type: params.type,
          style: params.style,
        );
      },
    );

    Overlay.of(context).insert(overlay!);
  }

  /// Show Plain Toast
  void _showToast({
    required ToastType type,
    required String title,
    required Duration duration,
    required Curve curve,
    String? subtitle,
    required ToastStyle style,
    bool showIcon = true,
  }) {
    final toast = ToastParams(
      title: title,
      duration: duration,
      curve: curve,
      type: type,
      showIcon: showIcon,
      style: style,
      subtitle: subtitle,
    );

    _enqueue(toast);
  }

  /// Show Success Toast
  ///
  /// Example :
  /// ```dart
  /// ThingToast(context).success(title: 'This is Success Toast');
  /// ```
  void success({
    required String title,
    Duration duration = const Duration(seconds: 3),
    Curve curve = Curves.easeInExpo,
    String? subtitle,
    ToastStyle style = const ToastStyle(),
    bool showIcon = true,
  }) {
    _showToast(
      type: ToastType.success,
      title: title,
      curve: curve,
      duration: duration,
      showIcon: showIcon,
      style: style,
      subtitle: subtitle,
    );
  }

  /// Show Info Toast
  ///
  /// Example :
  /// ```dart
  /// ThingToast(context).info(title: 'This is Information Toast');
  /// ```
  void info({
    required String title,
    Duration duration = const Duration(seconds: 3),
    Curve curve = Curves.easeInExpo,
    String? subtitle,
    ToastStyle style = const ToastStyle(),
    bool showIcon = true,
  }) {
    _showToast(
      type: ToastType.info,
      title: title,
      curve: curve,
      duration: duration,
      showIcon: showIcon,
      style: style,
      subtitle: subtitle,
    );
  }

  /// Show Warning Toast
  ///
  /// Example :
  /// ```dart
  /// ThingToast(context).warning(title: 'This is Warning Toast');
  /// ```
  void warning({
    required String title,
    Duration duration = const Duration(seconds: 3),
    Curve curve = Curves.easeInExpo,
    String? subtitle,
    ToastStyle style = const ToastStyle(),
    bool showIcon = true,
  }) {
    _showToast(
      type: ToastType.warning,
      title: title,
      curve: curve,
      duration: duration,
      showIcon: showIcon,
      style: style,
      subtitle: subtitle,
    );
  }

  /// Show Error Toast
  ///
  /// Example :
  /// ```dart
  /// ThingToast(context).error(title: 'This is Error Toast');
  /// ```
  void error({
    required String title,
    Duration duration = const Duration(seconds: 3),
    Curve curve = Curves.easeInExpo,
    String? subtitle,
    ToastStyle style = const ToastStyle(),
    bool showIcon = true,
  }) {
    _showToast(
      type: ToastType.error,
      title: title,
      curve: curve,
      duration: duration,
      showIcon: showIcon,
      style: style,
      subtitle: subtitle,
    );
  }
}
