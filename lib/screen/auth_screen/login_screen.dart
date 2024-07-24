import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/util/validator.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/button/loading_button.dart';
import 'package:black_hole/widget/form/app_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/constant/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      child: Padding(
        padding: AppUI.pagePadding,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(AppAsset.authIcon),
              AppUI.verticalGap(),
              Text('Welcome Back!', style: AppTextStyle.authTitle.copyWith(color: AppColor.titleDark)),
              AppUI.verticalGap(0.5),
              Text('Please enter your account here', style: AppTextStyle.authText),
              AppUI.verticalGap(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Forgot password?', style: AppTextStyle.authText)
                ],
              ),
              AppUI.verticalGap(),
              SizedBox(
                height: 55.h,
                width: 250.w,
                child: LoadingButton(
                  onTap: () async {
                    context.go('/');
                  },
                  backgroundColor: AppColor.buttonBG,
                  child: Text('Login', style: AppTextStyle.buttonTextStyle)
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
                  text: "Don't have an account ? ",
                  style: AppTextStyle.authText.copyWith(color: AppColor.borderColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: AppTextStyle.registerText.copyWith(color: AppColor.buttonBG),
                      recognizer: TapGestureRecognizer()
                        ..onTap = ()  {
                        context.go('/register');
                        },
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