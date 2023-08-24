import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

/// A widget that automatically sets the text direction based on content.
class AutoDirection extends StatefulWidget {
  /// The text content to determine the direction from.
  final String text;

  /// The child widget to apply the determined text direction to.
  final Widget child;

  /// Callback function to be called when text direction changes.
  final void Function(bool isRTL)? onDirectionChange;

  /// Creates an [AutoDirection] widget.
  ///
  /// The [text] parameter is the text content to determine the direction from.
  /// The [child] parameter is the widget to apply the determined text direction to.
  /// The [onDirectionChange] parameter is an optional callback to be called
  /// when the text direction changes.
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

  /// Determines the appropriate text direction based on the provided [text].
  TextDirection _calculateTextDirection(String text) {
    if (text.isEmpty) {
      return Directionality.of(context);
    }
    return intl.Bidi.detectRtlDirectionality(text)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  /// Checks if the provided [text] should be displayed in RTL direction.
  bool isRTL(String text) {
    return _calculateTextDirection(text) == TextDirection.rtl;
  }
}
