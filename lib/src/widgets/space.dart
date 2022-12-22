import 'package:caption/src/styles.dart';
import 'package:flutter/material.dart';

class VSpace extends StatelessWidget {
  const VSpace(this.size, {Key? key}) : super(key: key);

  static const xs = VSpace(Insets.xs);
  static const s = VSpace(Insets.s);
  static const m = VSpace(Insets.m);
  static const l = VSpace(Insets.l);
  static const xl = VSpace(Insets.xl);
  static const xxl = VSpace(Insets.xxl);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class HSpace extends StatelessWidget {
  const HSpace(this.size, {Key? key}) : super(key: key);

  static const xs = HSpace(Insets.xs);
  static const s = HSpace(Insets.s);
  static const m = HSpace(Insets.m);
  static const l = HSpace(Insets.l);
  static const xl = HSpace(Insets.xl);
  static const xxl = HSpace(Insets.xxl);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}
