import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/form/app_form_field.dart';
import 'package:black_hole/widget/form/phone_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../core/constant/assets.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/ui_const.dart';
import '../../core/util/validator.dart';
import '../../widget/button/loading_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
              AppUI.verticalGap(2),
              SvgPicture.asset(AppAsset.authIcon),
              AppUI.verticalGap(),
              Text('A New Pioneer !', style: AppTextStyle.authTitle.copyWith(color: AppColor.titleDark)),
              AppUI.verticalGap(0.5),
              Text('Please enter your account details', style: AppTextStyle.authText),
              AppUI.verticalGap(),
              AppFormField(
                hintText: 'Name',
                controller: nameController,
                validator: AppValidator.emptyValidator,
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.name, AutofillHints.familyName],
                textInputAction: TextInputAction.next,
                prefixIcon: Padding(
                  padding: AppUI.pagePadding,
                  child: SvgPicture.asset(AppAsset.nameChangeIcon),
                ),
              ),
              PhoneField(
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              AppFormField(
                hintText: 'Email',
                controller: emailController,
                validator: AppValidator.emailValidator,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                prefixIcon: Padding(
                  padding: AppUI.pagePadding,
                  child: SvgPicture.asset(AppAsset.messageIcon),
                ),
              ),
              AppFormField(
                hintText: 'Password',
                controller: passwordController,
                validator: AppValidator.passwordValidator,
                keyboardType: TextInputType.visiblePassword,
                autofillHints: const [AutofillHints.password],
                textInputAction: TextInputAction.done,
                prefixIcon: Padding(
                  padding: AppUI.pagePadding,
                  child: SvgPicture.asset(AppAsset.lockIcon),
                ),
              ),
              SizedBox(
                height: 55.h,
                width: 250.w,
                child: LoadingButton(
                    onTap: () async {},
                    backgroundColor: AppColor.buttonBG,
                    child: Text('Register', style: AppTextStyle.buttonTextStyle)
                ),
              ),
              AppUI.verticalGap(),
              Text('Or continue with', style: AppTextStyle.authText.copyWith(color: AppColor.borderColor)),
              AppUI.verticalGap(),
              SizedBox(
                height: 55.h,
                width: 250.w,
                child: LoadingButton(
                    onTap: () async {},
                    backgroundColor: AppColor.searchBGLight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(AppAsset.googleIcon),
                        AppUI.horizontalBlankSpace,
                        Text('Google', style: AppTextStyle.bigButtonText)
                      ],
                    )
                ),
              ),
              AppUI.verticalGap(),
              Text.rich(
                TextSpan(
                  text: "Already have an account ? ",
                  style: AppTextStyle.authText.copyWith(color: AppColor.productTitleBGDark),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: AppTextStyle.registerText.copyWith(color: AppColor.buttonBG),
                      recognizer: TapGestureRecognizer()
                        ..onTap = ()  {
                        context.go('/login');
                        },
                    ),
                  ],
                ),
              ),
              AppUI.verticalGap(2),
            ],
          ),
        ),
      ),
    );
  }
}