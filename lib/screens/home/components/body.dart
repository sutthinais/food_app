import 'package:flutter/material.dart';

import '../../../components/cards/big/restaurant_info_big_card.dart';
import '../../../constants.dart';
import '../../../components/section_title.dart';
import '../../../demoData.dart';
import '../../../screens/home/components/promotion_banner.dart';
import '../../../components/cards/big/big_card_image_slide.dart';

import '../../../size_config.dart';
import '../../details/details_screen.dart';
import 'medium_card_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BigCardImageSlide(images: demoBigImages),
            ),
            VerticalSpacing(of: 25),
            SectionTitle(
              title: "ความนิยม",
              press: () => null,
              //     Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => FeaturedScreen(),
              //   ),
              // ),
            ),
            VerticalSpacing(of: 15),
            MediumCardList(),
            VerticalSpacing(of: 25),
            // Banner
            PromotionBanner(),
            VerticalSpacing(of: 25),
            SectionTitle(
              title: "ดีที่สุดสำหรับคุณ",
              press: () => null

                //   Navigator.push(
                // context,
                // MaterialPageRoute(
                //   builder: (context) => FeaturedScreen(),
                // ),
              // ),
            ),
            VerticalSpacing(of: 15),
            MediumCardList(),
            VerticalSpacing(of: 25),
            SectionTitle(title: "ร้านค้าทั้งหมด", press: () {}),
            VerticalSpacing(of: 15),

            // Demo list of Big Cards
            ...List.generate(
              // For demo we use 4 items
              3,
              (index) => Padding(
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                child: RestaurantInfoBigCard(
                  // Images are List<String>
                  images: demoBigImages..shuffle(),
                  name: "ร้านขนมไทยอินดี้ $index'☺",
                  rating: 4.3,
                  numOfRating: 200,
                  deliveryTime: 25,
                  foodType: ["ฟาดฟูด", "อาหารญี่ปุ่น", "อาหารอีสาน"],
                  press: () =>
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(foodType: ["ฟาดฟูด", "อาหารญี่ปุ่น", "อาหารอีสาน"],name: "ร้านขนมไทยอินดี้' ${index+1}"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
