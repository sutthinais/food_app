import 'package:flutter/material.dart';
import 'package:food_app/size_config.dart';
import 'package:form_field_validator/form_field_validator.dart';

// clolors that we use in our app
const kMainColor = Color(0xFF010F07);
const kActiveColor = Color(0xFFF50057);
const kAccentColor = Color(0xFFEF9920);
const kBodyTextColor = Color(0xFF868686);
const kInputColor = Color(0xFFFBFBFB);
const kBgColor = Colors.white;

// Text Styles
final TextStyle kH1TextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(34),
  fontWeight: FontWeight.w500,
  letterSpacing: 0.22,
);

final TextStyle kH2TextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.w600,
  letterSpacing: 0.18,
);

final TextStyle kH3TextStyle = kH2TextStyle.copyWith(
  fontSize: getProportionateScreenWidth(16),
  letterSpacing: 0.14,
);

final TextStyle kHeadlineTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(30),
  fontWeight: FontWeight.bold,
);

final TextStyle kSubHeadTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.w500,
  color: kMainColor,
  letterSpacing: 0.44,
);

final TextStyle kBodyTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  color: kBodyTextColor,
  height: 1.5,
);

final TextStyle kSecondaryBodyTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.w500,
  color: kMainColor,
  // height: 1.5,
);

final TextStyle kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.bold,
);

final TextStyle kCaptionTextStyle = TextStyle(
  color: kMainColor.withOpacity(0.64),
  fontSize: getProportionateScreenWidth(12),
  fontWeight: FontWeight.w600,
);

// padding
const double kDefaultPadding = 20.0;
final EdgeInsets kTextFieldPadding = EdgeInsets.symmetric(
  horizontal: kDefaultPadding,
  vertical: getProportionateScreenHeight(kDefaultPadding),
);

// Default Animation Duration
const Duration kDefaultDuration = Duration(milliseconds: 250);

// Text Field Decoration
const OutlineInputBorder kDefaultOutlineInputBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(6)),
  borderSide: const BorderSide(
    color: Color(0xFFF3F2F2),
  ),
);

const InputDecoration otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.zero,
  counterText: "",
  errorStyle: TextStyle(height: 0),
);

const kErrorBorderSide = BorderSide(color: Colors.red, width: 1);

// Validator
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'กรุณากรอกรหัสผ่าน'),
  MinLengthValidator(8, errorText: 'รหัสผ่านต้องมีความยาวอย่างน้อย 8 หลัก'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-/])',
      errorText: 'รหัสผ่านต้องมีอักขระพิเศษอย่างน้อยหนึ่งตัว')
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'กรุณากรอกอีเมล'),
  EmailValidator(errorText: 'ใส่อีเมล์ที่ถูกต้อง')
]);

final requiredValidator =
    RequiredValidator(errorText: 'ฟิลด์นี้จำเป็นต้องระบุ');
final matchValidator = MatchValidator(errorText: 'รหัสผ่านไม่ตรงกัน');

final phoneNumberValidator = MinLengthValidator(10,
    errorText: 'หมายเลขโทรศัพท์ต้องมีความยาวอย่างน้อย 10 หลัก');

// Common Text
final Center kOrText = Center(
    child: Text("หรือ", style: TextStyle(color: kMainColor.withOpacity(0.7))));
