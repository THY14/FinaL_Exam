// Widget to disaply a restaurant stars chips
import 'package:final_exam/models/restaurant.dart';
import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {

 final Restaurant r;
  const StarsChip({super.key,required this.r});
  @override
  Widget build(BuildContext context) {
    return  Chip(
      avatar: Icon(Icons.star),
      label: Text(r.comments.isNotEmpty? r.totalStar().toStringAsFixed(1):"0.0")
    );
  }
}