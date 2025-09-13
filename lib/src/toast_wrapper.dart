import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thing_toast/src/toast_params.dart';
import 'package:thing_toast/src/toast_type.dart';
import 'package:thing_toast/src/toast_widget.dart';

/// Widget for toast animation and position
class ToastWrapper extends StatefulWidget {
  const ToastWrapper({
    super.key,
    required this.title,
    required this.duration,
    required this.curve,
    this.subtitle,
    required this.showIcon,
    required this.onDismiss,
    required this.type,
    required this.style,
  });

  final String title;
  final Duration duration;
  final Curve curve;
  final String? subtitle;
  final bool showIcon;
  final VoidCallback onDismiss;
  final ToastType type;
  final ToastStyle style;

  @override
  State<ToastWrapper> createState() => _ToastWrapperState();
}

class _ToastWrapperState extends State<ToastWrapper>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _position;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _position = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
        reverseCurve: widget.curve.flipped,
      ),
    );

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) _dismissAlert();
    });

    _scrollController.addListener(() {
      if (_scrollController.offset > 30) {
        _dismissAlert();
      }
    });
  }

  void _dismissAlert() {
    _controller.reverse().then((_) {
      if (mounted) widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 16,
      right: 16,
      top: 0,
      child: SlideTransition(
        position: _position,
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          controller: _scrollController,
          physics: AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: _child,
        ),
      ),
    );
  }

  // Child widget depends on Platform
  Widget get _child {
    if (Platform.isAndroid) {
      return Material(color: Colors.transparent, child: _baseToast());
    }

    return _baseToast();
  }

  // Base Widget of the Toast Wrapper
  Widget _baseToast() {
    return SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: 8),
          width: double.infinity,
          child: ToastWidget(
            title: widget.title,
            type: widget.type,
            icon: widget.style.icon,
            showIcon: widget.showIcon,
            subtitle: widget.subtitle,
            subtitleMaxLines: widget.style.subtitleMaxLines,
            titleMaxLines: widget.style.titleMaxLines,
            subtitleTextStyle: widget.style.subtitleTextStyle,
            titleTextStyle: widget.style.titleTextStyle,
          ),
        ),
      ),
    );
  }
}
