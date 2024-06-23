import 'dart:convert';

import 'package:flutter/material.dart';

class Tile {
  final int index;
  final Color color;
  Tile({
    required this.index,
    required this.color,
  });

  factory Tile.empty(int index) =>
      Tile(index: index, color: Colors.transparent);

  Tile copyWith({
    int? index,
    Color? color,
  }) {
    return Tile(
      index: index ?? this.index,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'index': index});
    result.addAll({'color': color.value});

    return result;
  }

  factory Tile.fromMap(Map<String, dynamic> map) {
    return Tile(
      index: map['index']?.toInt() ?? 0,
      color: Color(map['color']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tile.fromJson(String source) => Tile.fromMap(json.decode(source));

  @override
  String toString() => 'Tile(index: $index, color: $color)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tile && other.index == index && other.color == color;
  }

  @override
  int get hashCode => index.hashCode ^ color.hashCode;
}
