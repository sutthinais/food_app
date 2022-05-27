import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key,

    required  this.name,
    required  this.foodType,
  }) : super(key: key);
  final String name;
  final List<String> foodType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(name: name,foodType: foodType),
    );
  }

  AppBar buildAppBar(BuildContext context) {

    return AppBar(
      title: Text(name,style: kBodyTextStyle,),
      leading:      IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          
          },
        ),
      // actions: [
      //   IconButton(
      //     icon: SvgPicture.asset("assets/icons/share.svg"),
      //     onPressed: () {
      //       context.read<ChangeThemeApp>().changeThemeApp();
      //
      //     },
      //   ),
      //   IconButton(
      //     icon: SvgPicture.asset("assets/icons/search.svg"),
      //     onPressed: () => null
      //     //     Navigator.push(
      //     //   context,
      //     //   MaterialPageRoute(
      //     //     builder: (context) => SearchScreen(),
      //     //   ),
      //     // ),
      //   ),
      // ],
    );
  }

}
