import 'package:flutter/material.dart';
import 'package:shop_flutter/components/custom_suffix_icon.dart';
import 'package:shop_flutter/components/default_button.dart';
import 'package:shop_flutter/components/no_account_text.dart';
import 'package:shop_flutter/constants.dart';
import 'package:shop_flutter/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email = "test@gmail.com";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: email,
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value) {
              _formKey.currentState!.validate();
            },
            validator: (value) {
              if (value!.isEmpty) {
                return kEmailNullError;
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                return kInvalidEmailError;
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              suffixIcon: CustomSuffixIcon(
                svgIcon: "assets/icons/Mail.svg",
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          // FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
          ),
          NoAccountText(),
        ],
      ),
    );
  }
}
