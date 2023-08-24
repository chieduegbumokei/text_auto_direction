import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class AutoDirection extends StatefulWidget {
  final String text;
  final Widget child;
  final void Function(bool isRTL)? onDirectionChange;

  const AutoDirection({
    Key? key,
    required this.text,
    required this.child,
    this.onDirectionChange,
  }) : super(key: key);

  @override
  State<AutoDirection> createState() => _AutoDirectionState();
}

class _AutoDirectionState extends State<AutoDirection> {
  late String text;
  late TextDirection textDirection;

  @override
  void initState() {
    super.initState();
    text = widget.text;
    textDirection = _calculateTextDirection(text);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(AutoDirection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (text != widget.text) {
      text = widget.text;
      final newTextDirection = _calculateTextDirection(text);
      if (newTextDirection != textDirection) {
        textDirection = newTextDirection;
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => widget.onDirectionChange?.call(isRTL(text)),
        );
      }
    }
  }

  TextDirection _calculateTextDirection(String text) {
    if (text.isEmpty) {
      return Directionality.of(context);
    }
    return intl.Bidi.detectRtlDirectionality(text) ? TextDirection.rtl : TextDirection.ltr;
  }

  bool isRTL(String text) {
    return _calculateTextDirection(text) == TextDirection.rtl;
  }
}
