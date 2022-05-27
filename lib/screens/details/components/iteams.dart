import 'package:flutter/material.dart';
import '../../../components/cards/iteam_card.dart';
import '../../../constants.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTabController(
          length: demoTabs.length,
          child: TabBar(
            isScrollable: true,
            unselectedLabelColor: kMainColor.withOpacity(0.54),
            labelStyle: kH3TextStyle,
            onTap: (value) {
              // you will get selected tab index
            },
            tabs: demoTabs,
          ),
        ),
        // VerticalSpacing(),
        ...List.generate(
          demoData.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding - 5, vertical: kDefaultPadding / 2),
            child: ItemCard(
              title: demoData[index]["title"],
              description: demoData[index]["description"],
              image: demoData[index]["image"],
              foodType: demoData[index]['foodType'],
              price: demoData[index]["price"],
              priceRange: demoData[index]["priceRange"],
              press: () =>null
              //     Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => AddToOrderScrreen(),
              //   ),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}

final List<Tab> demoTabs = <Tab>[
  Tab(
    child: Text('ยอดนิยม'),
  ),
  Tab(
    child: Text('เนื้อและแกะ'),
  ),
  Tab(
    child: Text('อาหารทะเล'),
  ),
  Tab(
    child: Text('ของหวาน'),
  ),
  Tab(
    child: Text('ขนมขบเคี้ยว'),
  ),
];

final List<Map<String, dynamic>> demoData = List.generate(
  3,
  (index) => {
    "image": "assets/images/featured _items_${index + 1}.png",
    "title": "คุกกี้แซนวิช",
    "description": "ขนมชนิดร่วน คุกกี้ช็อกโกแลตเต่า และกำมะหยี่สีแดง",
    "price": 7.4,
    "foodType": "อาหารจีน",
    "priceRange": "\$" * 2,
  },
);
