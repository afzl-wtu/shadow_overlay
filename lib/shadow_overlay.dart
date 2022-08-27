library shadow_overlay;

import 'package:flutter/material.dart';

/// Creates transparency effect behind a Widget specially a Image, if Background is a
/// color. Otherwise it is a just a overlay of gradient of given color with transparency.
class ShadowOverlay extends StatelessWidget {
  final Widget child;

  /// shadowHeight defines transparency height from bottom of child.
  /// shadowWidth is usually equal to child width.
  final double shadowHeight, shadowWidth;

  /// Default is white. Default is better if child background is White.
  /// If background color is other then white use that color here. It is also possible to
  /// make it conditonal on `Theme.of(context).brightness==Brightness.dark`.
  final Color shadowColor;
  const ShadowOverlay(
      {Key? key,
      required this.child,
      this.shadowColor = Colors.white,
      required this.shadowHeight,
      required this.shadowWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          Positioned(
            bottom: -1,
            child: Container(
              height: shadowHeight,
              width: shadowWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [shadowColor, shadowColor.withOpacity(0)],
                ),
              ),
            ),
          )
        ],
      );
}
