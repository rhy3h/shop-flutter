import 'package:flutter/material.dart';
import 'package:shop_flutter/components/custom_suffix_icon.dart';
import 'package:shop_flutter/components/default_button.dart';
import 'package:shop_flutter/constants.dart';
import 'package:shop_flutter/screens/otp/otp_screen.dart';
import 'package:shop_flutter/size_config.dart';

class CompleteProfileFrom extends StatefulWidget {
  const CompleteProfileFrom({Key? key}) : super(key: key);

  @override
  _CompleteProfileFromState createState() => _CompleteProfileFromState();
}

class _CompleteProfileFromState extends State<CompleteProfileFrom> {
  final _formkey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName = "test";
  String lastName = "";
  String phoneNumber = "012345678";
  String address = "test";

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      _formkey.currentState!.validate();
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: Column(
          children: [
            buildFirstNameField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildLastNameField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPhoneField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildLoactionField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formkey.currentState!.validate()) {
                  // Go to OTP screen
                  Navigator.pushNamed(context, OTPScreen.routeName);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildLoactionField() {
    return TextFormField(
      initialValue: address,
      keyboardType: TextInputType.streetAddress,
      onSaved: (newValue) => address = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return kAddressNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Location point.svg",
        ),
      ),
    );
  }

  TextFormField buildPhoneField() {
    return TextFormField(
      initialValue: phoneNumber,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return kPhoneNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      initialValue: lastName,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => lastName = newValue!,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      initialValue: firstName,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return kNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/User.svg",
        ),
      ),
    );
  }
}
