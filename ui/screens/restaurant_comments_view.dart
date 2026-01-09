// YOUR CODE

import 'package:final_exam/models/restaurant.dart';
import 'package:final_exam/models/restuarant_comment.dart';
import 'package:final_exam/ui/screens/restaurant_comments_form.dart';
import 'package:flutter/material.dart';
import 'package:final_exam/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:final_exam/ui/widgets/chip/stars_chip.dart';

class RestaurantCommentsView extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCommentsView({super.key, required this.restaurant});

  @override
  State<RestaurantCommentsView> createState() => _RestaurantCommentsViewState();
}

class _RestaurantCommentsViewState extends State<RestaurantCommentsView> {
  void showDialog(BuildContext context) async {
    final data = await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return RestaurantCommentsForm();
      },
    );
    setState(() {
      widget.restaurant.addComment(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context);
        },
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            color: Colors.blue,
            child: Center(
              child: Column(
                spacing: 10,
                children: [
                  Text(widget.restaurant.name, style: TextStyle(fontSize: 40)),
                  Text(widget.restaurant.address),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      RestaurantTypeChip(type: widget.restaurant.type),
                      StarsChip(r: widget.restaurant),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.restaurant.comments.length,
              itemBuilder: (context, index) {
                RestaurantComment comment = widget.restaurant.comments[index];
                return CommentListTile(
                  title: comment.feedback,
                  star: comment.stars,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CommentListTile extends StatelessWidget {
  final String title;
  final double star;

  const CommentListTile({super.key, required this.title, required this.star});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Text(star.toStringAsPrecision(1), style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
