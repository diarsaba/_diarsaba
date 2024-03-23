import 'package:flutter/material.dart';

class Stroke {
  final String string;

  Stroke({required this.string});

  Stroke copyWith({
    String? string,
  }) {
    return Stroke(
      string: string ?? this.string,
    );
  }
}


class Body {
  final String s;

  final double x;
  final double y;

  final String key;

  final Widget render;

  final String mode;

  Body(
      {required this.x,
      required this.y,
      required this.s,
      required this.key,
      required this.render,
      required this.mode});

  Body copyWith({
    double? x,
    double? y,
    String? s,
    String? key,
    Widget? render,
    String? mode,
  }) {
    return Body(
        x: x ?? this.x,
        y: y ?? this.y,
        s: s ?? this.s,
        key: key ?? this.key,
        render: render ?? this.render,
        mode: mode ?? this.mode);
  }
}

class Bodyd {
  final double s;

  final double x;
  final double y;

  final String key;

  final Widget render;

  final String mode;

  Bodyd(
      {required this.x,
      required this.y,
      required this.s,
      required this.key,
      required this.render,
      required this.mode});

  Bodyd copyWith({
    double? x,
    double? y,
    double? s,
    String? key,
    Widget? render,
    String? mode,
  }) {
    return Bodyd(
        x: x ?? this.x,
        y: y ?? this.y,
        s: s ?? this.s,
        key: key ?? this.key,
        render: render ?? this.render,
        mode: mode ?? this.mode);
  }
}
