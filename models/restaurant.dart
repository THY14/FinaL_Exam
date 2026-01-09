import 'package:final_exam/models/restuarant_comment.dart';

import 'restaurant_type.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<RestaurantComment> comments;
 
  Restaurant({required this.name, required this.address, required this.type ,List<RestaurantComment>? comment}):comments=comment??[];

  void addComment(RestaurantComment comment){
    comments.add(comment);
  }

  double totalStar(){
    double total=0;
    for(int i=0;i<comments.length;i++){
      total+=comments[i].stars;
    }

    return total/comments.length;
  }
}
