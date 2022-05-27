import 'package:flutter/material.dart';

import '../../../../components/buttons/primary_button.dart';
import '../../../../components/dot_indicators.dart';
import '../../../../constants.dart';
import '../../../size_config.dart';
import '../../signIn/sign_in_screen.dart';
import 'onboard_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Spacer(flex: 2),
                Expanded(
                  flex: 14,
                  child: PageView.builder(
                    itemCount: demoData.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) => OnboardContent(
                      illustration: demoData[index]["illustration"],
                      title: demoData[index]["title"],
                      text: demoData[index]["text"],
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(demoData.length,
                      (index) => DotIndicator(isActive: index == currentPage)),
                ),
                Spacer(flex: 2),

                Spacer(flex: 2,),
              ],
            ),
            currentPage == (demoData.length-1)? Column(mainAxisAlignment: MainAxisAlignment.end,children: [
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: PrimaryButton(
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  ),
                  text: "เริ่มการใช้งาน",
                ),
              ),
              SizedBox(height: 20,)
            ],):SizedBox(height: getProportionateScreenWidth(15),),
          ],
        ),
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "assets/Illustrations/Illustrations_1.svg",
    "title": "รายการโปรดทั้งหมดของคุณ",
    "text":
        "ข้อความโลเร็ม อิปซัมเป็นข้อความส่วนหนึ่งในภาษาละตินที่แต่งโดย ซิเซโร",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_2.svg",
    "title": "ข้อเสนอการจัดส่งฟรี",
    "text":
        "ข้อความโลเร็ม อิปซัมเป็นข้อความส่วนหนึ่งในภาษาละตินที่แต่งโดย ซิเซโร",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_3.svg",
    "title": "เลือกอาหารของคุณ",
    "text":
        "ข้อความโลเร็ม อิปซัมเป็นข้อความส่วนหนึ่งในภาษาละตินที่แต่งโดย ซิเซโร",
  },
];
