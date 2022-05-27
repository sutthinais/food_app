import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../size_config.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// If you set your home screen as first screen make sure call [SizeConfig().init(context)]
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // leading: SizedBox(),
      title: Column(
        children: [
          // Text(
          //   "Delivery to".toUpperCase(),
          //   style: Theme.of(context)
          //       .textTheme
          //       .caption!
          //       .copyWith(color: kActiveColor),
          // ),
          Text("ตำแหน่งทดสอบ เอวีเอทีที อุบลราชธานี",style: TextStyle(color: Colors.black87,fontSize: 12),)
        ],
      ),
      actions: [
        // Filter Button
        // FlatButton(
        //   onPressed: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => FilterScreen(),
        //     ),
        //   ),
        //   child: Text(
        //     "Filter",
        //     style: Theme.of(context).textTheme.bodyText1,
        //   ),
        // ),
      ],
    );
  }
}
