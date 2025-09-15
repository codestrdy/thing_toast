import 'package:flutter/material.dart';
import 'package:thing_toast/src/colors.dart';
import 'package:thing_toast/src/toast_type.dart';

/// The main widget of the toast
class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    required this.title,
    required this.type,
    this.subtitle,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.titleMaxLines = 3,
    this.subtitleMaxLines = 3,
    this.icon,
  });

  final String title;
  final String? subtitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final int titleMaxLines;
  final int subtitleMaxLines;
  final Widget? icon;
  final ToastType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      constraints: BoxConstraints(minHeight: 64, minWidth: double.infinity),
      decoration: BoxDecoration(
        gradient: type.gradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: type.color,
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      child: Row(
        spacing: 12,
        children: [
          ?icon,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Text(
                  title,
                  style:
                      titleTextStyle ??
                      TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: titleMaxLines,
                ),
                ?_subtitle,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget? get _subtitle {
    if (subtitle == null) return null;
    return Text(
      subtitle!,
      style: subtitleTextStyle ?? TextStyle(fontSize: 11, color: subtitleColor),
      overflow: TextOverflow.ellipsis,
      maxLines: subtitleMaxLines,
    );
  }
}
