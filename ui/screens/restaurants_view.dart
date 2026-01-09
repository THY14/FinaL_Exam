import 'package:final_exam/models/restaurant_type.dart';
import 'package:final_exam/ui/screens/restaurant_comments_view.dart';
import 'package:final_exam/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:final_exam/ui/widgets/chip/stars_chip.dart';
import 'package:flutter/material.dart';

import '../../models/restaurant.dart';
import '../theme.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {

  bool isChecked = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),

      body: 
          Column(
            children: [
            Row(
              children: [
                Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
                },
              ),
              Text("Only Camfood"),
              ],
            ),
            Expanded(child:
            ListView.builder(
                itemCount: widget.restaurants.length,
                itemBuilder: (context,index){
                  Restaurant selected=widget.restaurants[index];
                  if(isChecked&&selected.type!=RestaurantType.khmer){
                    return SizedBox.shrink();
                  }
                  return GestureDetector(
                    onTap: () async{
                      await Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (_)=>RestaurantCommentsView(restaurant: selected))
                      );
                      setState(() {
                      });
                    },
                    child:  RestaurantListTile(restaurant: selected)
                  );
                }
              ), 
            )
            ],
          )
      );
  }
}

class RestaurantListTile extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantListTile({
    super.key,
    required this.restaurant
    });

  @override
  Widget build(BuildContext context) {
    return 
      Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(restaurant.name,
             style: TextStyle(
              fontSize: 20
             ),
            ),
            Row(
              spacing: 10,
              children: [
                StarsChip(r:restaurant),
                RestaurantTypeChip(type: restaurant.type)
              ],
            )
          ],
        ),
    );
  }
}
 