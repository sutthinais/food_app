import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/screens/details/details_screen.dart';


import '../../../components/cards/big/restaurant_info_big_card.dart';
import '../../../components/scalton/big_card_scalton.dart';
import '../../../constants.dart';
import '../../../demoData.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _showSearchResult = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void showResult() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showSearchResult = true;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 10),
            // Text('ค้าหา', style: kH2TextStyle),
            VerticalSpacing(),
            buildSearchForm(),
            VerticalSpacing(),
            Text(_showSearchResult ? "ผลลัพธ์ค้นหา" : "ร้านต้ายอดนิยม",
                style: kSubHeadTextStyle),
            VerticalSpacing(),
            Expanded(
              child: ListView.builder(
                itemCount: _isLoading ? 2 : 5, //5 is demo length of your data
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding),
                  child: _isLoading
                      ? BigCardScalton(name: "ร้านค้าทดสอบ$index", foodType: ["อาหารจีน", "อาหารไทย", "อาหารว่าง"])
                      : RestaurantInfoBigCard(
                          // Images are List<String>
                          images: demoBigImages..shuffle(),
                          name: "ร้านค้าทดสอบ$index",
                          rating: 4.3,
                          numOfRating: 200,
                          deliveryTime: 25,
                          foodType: ["อาหารจีน", "อาหารไทย", "อาหารว่าง"],
                          press: () {
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsScreen(name: "ร้านค้าทดสอบ$index", foodType: ["อาหารจีน", "อาหารไทย", "อาหารว่าง"])));
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form buildSearchForm() {
    return Form(
      key: _formKey,
      child: TextFormField(
        onChanged: (value) {
          // get data while typing
          if (value.length >= 3) showResult();
        },
        onFieldSubmitted: (value) {
          if (_formKey.currentState!.validate()) {
            // If all data are correct then save data to out variables
            _formKey.currentState!.save();

            // Once user pree on submit
            showResult();
          } else {
            // If all data are not valid then start auto validation.
            setState(() {
              _autoValidate = true;
            });
          }
        },
        validator: requiredValidator,
        // autovalidate: _autoValidate,
        style: kSecondaryBodyTextStyle,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Search on foodly",
          contentPadding: kTextFieldPadding,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: kBodyTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
