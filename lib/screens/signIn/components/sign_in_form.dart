import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../components/bottom_nav_bar.dart';
import '../../../constants.dart';
import '../../../main.dart';
import '../../../size_config.dart';
import '../../../components/buttons/primary_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _obscureText = true;

  FocusNode? _passwordNode;

  @override
  void initState() {
    super.initState();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordNode!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String? _email, _password;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            // autovalidate: _autoValidate,
            validator: emailValidator,
            onSaved: (value) => _email = value,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              // Once user click on Next then it go to password field
              _passwordNode!.requestFocus();
            },
            style: kSecondaryBodyTextStyle,
            cursorColor: kActiveColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "ที่อยู่อีเมล",
              contentPadding: kTextFieldPadding,
            ),
          ),
          VerticalSpacing(),

          // Password Field
          TextFormField(
            focusNode: _passwordNode,
            obscureText: _obscureText,
            // autovalidate: _autoValidate,
            validator: passwordValidator,
            onSaved: (value) => _password = value,
            style: kSecondaryBodyTextStyle,
            cursorColor: kActiveColor,
            decoration: InputDecoration(
              hintText: "รหัสผ่าน",
              contentPadding: kTextFieldPadding,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: kBodyTextColor)
                    : const Icon(Icons.visibility, color: kBodyTextColor),
              ),
            ),
          ),
          VerticalSpacing(),

          // Forget Password
          GestureDetector(
            onTap: () => null,
            //   Navigator.push(
            // context,
            // MaterialPageRoute(
            //   builder: (context) => ForgotPasswordScreen(),
            // ),
            // ),
            child: Text(
              "ลืมรหัสผ่านใช่ไหม?",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          VerticalSpacing(),

          // Sign In Button
          PrimaryButton(
            text: "เข้าสู่ระบบ",
            press: () {
              if (_formKey.currentState!.validate()) {
                // If all data are correct then save data to out variables
                _formKey.currentState!.save();

                // loginAndAuthenticateUser(
                //     context, _email ?? '', _password ?? '');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavBar(),
                    ));
              } else {
                // If all data are not valid then start auto validation.
                setState(() {
                  _autoValidate = true;
                });
              }
            },
          )
        ],
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(
      BuildContext context, String email, String password) async {
    final User? firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .catchError((errMsg) {
      Navigator.pop(context);
      // displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) {
      usersRef.child(firebaseUser.uid).get().then((DataSnapshot snap) {
        if (snap.value != null) {
          // just for demo
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => BottomNavBar(),
          //     ));
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);

          // Navigator.pushNamedAndRemoveUntil(
          //     context, MainScreen.idScreen, (route) => false);
          // displayToastMessage("you are logged-in now.", context);
        } else {
          Navigator.pop(context);
          _firebaseAuth.signOut();
          // displayToastMessage(
          //     "No record exists for this user. Please create new account.",
          //     context);
        }
      });
    } else {
      Navigator.pop(context);
      // displayToastMessage("Error Occured, can not be Signed-in.", context);
    }
  }
}
