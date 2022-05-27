import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'featured_items.dart';
import 'iteams.dart';
import 'restaurrant_info.dart';

class Body extends StatelessWidget {
  const Body({Key? key,required  this.name,
    required  this.foodType,}) : super(key: key);
  final String name;
  final List<String> foodType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 10),
            RestaurantInfo(name: name,foodType: foodType),
            VerticalSpacing(),
            FeaturedItems(),
            Items(),
          ],
        ),
      ),
    );
  }
}
