import 'package:flutter/material.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'order_item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            VerticalSpacing(),
            // List of cart items
            ...List.generate(
              demoItems.length,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: OrderedItemCard(
                  title: demoItems[index]["title"],
                  description:
                      "แบดสตาร์ท เจี๊ยว สถาปัตย์แลนด์ โบว์ลิ่งเกรย์เพนกวิน วานิลลาแชมปิยองซินโดรมพุทธศตวรรษ",
                  numOfItem: demoItems[index]["numOfItem"],
                  price: demoItems[index]["price"].toDouble(),
                ),
              ),
            ),
            buildPriceRow(text: "ยอดรวม", price: 28.0),
            VerticalSpacing(of: 10),
            buildPriceRow(text: "ค่าจัดส่ง", price: 0),
            VerticalSpacing(of: 10),
            buildTotal(price: 20),
            VerticalSpacing(of: 40),
            PrimaryButton(
              text: "ชำระเงิน (20.10) บาท",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }

  Row buildTotal({required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: "ยอดสุทธิ ",
            style: kBodyTextStyle.copyWith(
                color: kMainColor, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: "(VAT 7%)",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Text(
          "$price บาท",
          style: kBodyTextStyle.copyWith(
              color: kMainColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Row buildPriceRow({required String text, required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: kBodyTextStyle.copyWith(color: kMainColor),
        ),
        Text(
          "$price บาท",
          style: kBodyTextStyle.copyWith(color: kMainColor),
        )
      ],
    );
  }
}

const List<Map> demoItems = [
  {
    "title": "อาหารไมย",
    "price": 7.4,
    "numOfItem": 1,
  },
  {
    "title": "ขนมจีนน้ำยาทดสอบ",
    "price": 12,
    "numOfItem": 1,
  },
  {
    "title": "ขนมจีนน้ำยาไข่เค็ม",
    "price": 8.6,
    "numOfItem": 2,
  },
];
