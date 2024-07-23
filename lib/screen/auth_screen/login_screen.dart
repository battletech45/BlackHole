import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/util/validator.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/button/loading_button.dart';
import 'package:black_hole/widget/text_field/app_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constant/colors.dart';

class LoginScreen extends StatefulWidget {
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
      child: SingleChildScrollView(
        padding: AppUI.pagePadding,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(AppAsset.authIcon),
              AppUI.verticalBlankSpace,
              Text('Welcome Back!', style: AppTextStyle.authTitle),
              AppUI.verticalBlankSpace,
              Text('Please enter your account here', style: AppTextStyle.authText),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Forgot password?', style: AppTextStyle.authText)
                ],
              ),
              AppUI.verticalBlankSpace,
              LoadingButton(
                onTap: () async {},
                backgroundColor: AppColor.buttonBG,
                child: Text('Login', style: AppTextStyle.buttonTextStyle)
              ),
              AppUI.verticalBlankSpace,

            ],
          ),
        ),
      ),
    );
  }
}