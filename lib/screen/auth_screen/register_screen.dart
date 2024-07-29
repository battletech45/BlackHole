import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/model/login.dart';
import 'package:black_hole/core/service/provider/auth.dart';
import 'package:black_hole/core/util/extension.dart';
import 'package:black_hole/widget/base/appbar.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/dialog/alert_dialog.dart';
import 'package:black_hole/widget/form/app_form_field.dart';
import 'package:black_hole/widget/form/phone_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';
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

  Future<void> send() async {
    if(_formKey.currentState!.validate()) {
      context.read<AutherProvider>().register(nameController.text, LoginModel(email: emailController.text, password: passwordController.text), phoneNumber.number).then((value) {
        if(value == null) {
          context.showAppDialog(
            AppAlertDialog(
              type: AlertType.approved,
              title: 'Başarılı',
              text: 'Kayıt Başarılı Oldu.',
              isSingleButton: true,
            )
          ).then((e) {
            context.go(('/'));
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      appBar: AppAppBar(isDrawer: false),
      child: SingleChildScrollView(
        padding: AppUI.pagePadding,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                obscureText: true,
                prefixIcon: Padding(
                  padding: AppUI.pagePadding,
                  child: SvgPicture.asset(AppAsset.lockIcon),
                ),
              ),
              SizedBox(
                height: 55.h,
                width: 250.w,
                child: LoadingButton(
                    onTap: send,
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
                    onTap: () async {
                      if(await context.read<AutherProvider>().loginWithGoogle()) {
                        context.go('/');
                      }
                      else {
                        context.showAppDialog(
                            AppAlertDialog(
                              text: 'Bir Hata Oluştu. Daha Sonra Tekrar Deneyin.',
                              title: 'Hata !',
                              isSingleButton: true,
                              type: AlertType.denied,
                            )
                        );
                      }
                    },
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
                        context.pushReplacement('/login');
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