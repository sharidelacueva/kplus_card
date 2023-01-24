import 'package:flutter/material.dart';
import 'package:kplus_card/utils/size_config.dart';

class KplusCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  KplusCard({
    this.child,
    this.padding = const EdgeInsets.all(12.0),
    this.margin = const EdgeInsets.only(bottom: 15.0, left: 12.0, right: 12.0),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(getScreenPixel(10.0))),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
