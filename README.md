# Auto Direction Package

A Flutter package that provides the `AutoDirection` widget for automatic text direction detection.

## Features

- Automatically sets text direction based on content.
- Supports dynamic detection of left-to-right (LTR) and right-to-left (RTL) direction.

## Getting Started

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  auto_direction_package: ^1.0.0
```

## Usage

Wrap your widget that contains text with the AutoDirection widget:

```dart
import 'package:flutter/material.dart';
import 'package:auto_direction_package/auto_direction_package.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AutoDirection(
            text: "مرحبًا بك في Flutter!",
            child: Text("مرحبًا بك في Flutter!"),
          ),
        ),
      ),
    );
  }
}
```

## Additional information

To contribute, report issues, or find more about the package, visit the [GitHub repository](https://github.com/chieduegbumokei/text_auto_direction).

This package is maintained by **Chiedu Egbumokei**.
