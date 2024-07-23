import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/form/app_form_field.dart';
import 'package:black_hole/widget/form/phone_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../core/constant/assets.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/ui_const.dart';
import '../../core/util/validator.dart';
import '../../widget/button/loading_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  PhoneNumber phoneNumber = PhoneNumber(countryISOCode: 'TR', countryCode: '90', number: '');

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      child: SingleChildScrollView(
        padding: AppUI.pagePadding,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(AppAsset.authIcon),
              AppUI.verticalBlankSpace,
              Text('A New Pioneer !'),
              AppUI.verticalBlankSpace,
              Text('Please enter your account details', style: AppTextStyle.authText),
              AppUI.verticalBlankSpace,
              AppFormField(
                hintText: 'Name',
                controller: nameController,
                validator: AppValidator.emptyValidator,
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.name, AutofillHints.familyName],
                textInputAction: TextInputAction.next,
                prefixIcon: SvgPicture.asset(AppAsset.nameChangeIcon),
              ),
              AppUI.verticalBlankSpace,
              PhoneField(
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              AppUI.verticalBlankSpace,
              AppFormField(
                hintText: 'Email',
                controller: emailController,
                validator: AppValidator.emailValidator,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                prefixIcon: SvgPicture.asset(AppAsset.messageIcon),
              ),
              AppUI.verticalBlankSpace,
              AppFormField(
                hintText: 'Password',
                controller: passwordController,
                validator: AppValidator.passwordValidator,
                keyboardType: TextInputType.visiblePassword,
                autofillHints: const [AutofillHints.password],
                textInputAction: TextInputAction.done,
                prefixIcon: SvgPicture.asset(AppAsset.lockIcon),
              ),
              AppUI.verticalBlankSpace,
              LoadingButton(
                  onTap: () async {},
                  backgroundColor: AppColor.buttonBG,
                  child: Text('Login', style: AppTextStyle.buttonTextStyle)
              ),
              AppUI.verticalBlankSpace,
              Text.rich(
                TextSpan(
                  text: "Already have an account ? ",
                  style: AppTextStyle.authText.copyWith(color: AppColor.productTitleBGDark),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: AppTextStyle.registerText.copyWith(color: AppColor.buttonBG),
                      recognizer: TapGestureRecognizer()
                        ..onTap = ()  {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}