import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../components/buttons/socal_button.dart';
import '../../../../components/welcome_text.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../signIn/sign_in_screen.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeText(
                  title: "สร้างบัญชีใหม่",
                  text: "ป้อนชื่อ อีเมล และรหัสผ่านของคุณ \nสำหรับการสมัคร",
                ),

                // Sign Up Form
                SignUpForm(),
                VerticalSpacing(of: 20),

                // Already have account
                Center(
                  child: Text.rich(
                    TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontWeight: FontWeight.w500),
                      text: "คุณมีบัญชีอยู่แล้ว? ",
                      children: <TextSpan>[
                        TextSpan(
                          text: "เข้าสู่ระบบ",
                          style: TextStyle(color: kActiveColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalSpacing(of: 20),
                Center(
                  child: Text(
                    "การลงทะเบียนแสดงว่าคุณยอมรับข้อกำหนด \nเงื่อนไขและนโยบายความเป็นส่วนตัวของเรา",
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ),
                VerticalSpacing(of: 15),
                // kOrText,
                VerticalSpacing(of: 15),

                // Facebook
                // SocalButton(
                //   press: () {},
                //   text: "Connect with Facebook",
                //   color: Color(0xFF395998),
                //   icon: SvgPicture.asset(
                //     'assets/icons/facebook.svg',
                //     color: Color(0xFF395998),
                //   ),
                // ),
                // VerticalSpacing(of: 15),
                //
                // // Google
                // SocalButton(
                //   press: () {},
                //   text: "Connect with Google",
                //   color: Color(0xFF4285F4),
                //   icon: SvgPicture.asset(
                //     'assets/icons/google.svg',
                //   ),
                // ),
                VerticalSpacing(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
