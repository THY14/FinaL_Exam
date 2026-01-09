// Widget to disaply a restaurant type chip
import 'package:final_exam/models/restaurant_type.dart';
import 'package:flutter/material.dart';

class RestaurantTypeChip extends StatelessWidget {
  final RestaurantType type;
  const RestaurantTypeChip({
    super.key,
    required this.type
    });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(type.name.toUpperCase()),
      backgroundColor: type.color,
    );
  }
}