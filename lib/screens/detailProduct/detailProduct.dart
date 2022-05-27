import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../models/productModel.dart';


class DetailProduct extends StatefulWidget {

  const DetailProduct({Key? key,required this.product}) : super(key: key);
  final Product product;
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context),body: Body(),);
  }

  Widget Body(){
    return Column();
  }
  AppBar buildAppBar(BuildContext context) {

    return AppBar(
      title: Text(widget.product.name??'',style: kBodyTextStyle,),
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
