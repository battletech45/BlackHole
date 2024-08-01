import 'dart:io';

import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/util/extension.dart';
import 'package:black_hole/core/util/validator.dart';
import 'package:black_hole/widget/base/appbar.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constant/assets.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/ui_const.dart';
import '../../core/service/firebase.dart';
import '../../widget/button/loading_button.dart';
import '../../widget/dialog/alert_dialog.dart';
import '../../widget/form/app_form_field.dart';

class AddCampaignScreen extends StatefulWidget {
  const AddCampaignScreen({super.key});
  @override
  State<AddCampaignScreen> createState() => _AddCampaignScreenState();
}

class _AddCampaignScreenState extends State<AddCampaignScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  File? imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> send() async {
    if(_formKey.currentState!.validate() && imageFile != null) {
      final String? productID = await FirebaseService.createNewsItem(titleController.text, descController.text, dateController.text);
      if(productID != null) {
        await FirebaseService.uplaodNewsImageToFirebase(productID, imageFile!).then((value) {
          context.showAppDialog(
              AppAlertDialog(
                type: AlertType.approved,
                text: 'Yükleme Başarılı Oldu.',
                title: 'Başarılı !',
                isSingleButton: true,
              )
          ).then((e) {
            context.pop();
          });
        });
      }
    }
    else {
      print('Not Added');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      backgroundColor: AppColor.backgroundDark,
      resizeToAvoidBottomInset: true,
      appBar: AppAppBar(isDrawer: false),
      child: SingleChildScrollView(
        padding: AppUI.pagePadding,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Yeni Haber Gir', style: AppTextStyle.ratingOverallText),
              AppUI.verticalGap(),
              AppFormField(
                hintText: 'Haber Başlığı',
                controller: titleController,
                validator: AppValidator.emptyValidator,
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.jobTitle],
                textInputAction: TextInputAction.next,
              ),
              AppUI.verticalGap(),
              AppFormField(
                hintText: 'Haber tarihi',
                controller: dateController,
                keyboardType: TextInputType.datetime,
                autofillHints: const [AutofillHints.birthday],
                textInputAction: TextInputAction.next,
              ),
              AppUI.verticalGap(),
              AppFormField(
                hintText: 'Haber açıklaması',
                controller: descController,
                keyboardType: TextInputType.text,
                isBigField: true,
                autofillHints: const [AutofillHints.name],
                textInputAction: TextInputAction.next,
              ),
              AppUI.verticalGap(),
              Image.asset(imageFile != null ? imageFile!.path : AppAsset.appLogo, width: 250.w, height: 250.h, fit: BoxFit.cover),
              AppUI.verticalGap(),
              SizedBox(
                height: 50.h,
                width: 250.w,
                child: LoadingButton(
                  backgroundColor: AppColor.hintTextColor,
                  child: Text('Fotoğraf Seç',  style: AppTextStyle.bigButtonText.copyWith(color: AppColor.white)),
                  onTap: _pickImage,
                ),
              ),
              AppUI.verticalGap(),
              SizedBox(
                height: 50.h,
                width: 250.w,
                child: LoadingButton(
                  backgroundColor: AppColor.buttonBG,
                  child: Text('Haberi Ekle', style: AppTextStyle.bigButtonText.copyWith(color: AppColor.white)),
                  onTap: send,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}