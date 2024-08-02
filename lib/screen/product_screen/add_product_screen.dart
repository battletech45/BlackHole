import 'dart:io';
import 'package:black_hole/core/constant/assets.dart';
import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/service/firebase.dart';
import 'package:black_hole/core/util/extension.dart';
import 'package:black_hole/core/util/validator.dart';
import 'package:black_hole/widget/base/appbar.dart';
import 'package:black_hole/widget/base/scaffold.dart';
import 'package:black_hole/widget/button/add_button.dart';
import 'package:black_hole/widget/button/loading_button.dart';
import 'package:black_hole/widget/dialog/alert_dialog.dart';
import 'package:black_hole/widget/form/app_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController extraController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  File? imageFile;
  List<String> ingredients = [];
  List<String> prices = [];
  List<String> sizes = [];
  List<TextEditingController> ingredientsController = [];
  List<TextEditingController> sizesController = [];
  List<TextEditingController> pricesController = [];

  Future<void> send() async {
    if(_formKey.currentState!.validate() && imageFile != null) {
      ingredientsController.forEach((element) {
        setState(() {
          ingredients.add(element.text);
        });
      });
      sizesController.forEach((element) {
        setState(() {
          sizes.add(element.text);
        });
      });
      pricesController.forEach((element) {
        setState(() {
          prices.add(element.text);
        });
      });
      final String? productID = await FirebaseService.createMenuItem(titleController.text, extraController.text, descController.text, ingredients, sizes, prices);
      if(productID != null) {
        await FirebaseService.uploadImageToFirebase(productID, imageFile!).then((value) {
          context.showAppDialog(
            AppAlertDialog(
              type: AlertType.approved,
              text: 'Yükleme Başarılı Oldu.',
              title: 'Başarılı !',
              isSingleButton: true,
            )
          );
        });
      }
    }
    else {
      print('Not Added');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundImage: false,
      backgroundColor: AppColor.backgroundDark,
      resizeToAvoidBottomInset: true,
      appBar: AppAppBar(
        isDrawer: false,
      ),
      child: SingleChildScrollView(
        padding: AppUI.pagePadding,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Menüye Ürün Ekle', style: AppTextStyle.ratingOverallText),
              AppUI.verticalGap(),
              AppFormField(
                hintText: 'Ürün Adı',
                controller: titleController,
                validator: AppValidator.emptyValidator,
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.name],
                textInputAction: TextInputAction.next,
              ),
              AppUI.verticalGap(2),
              AppFormField(
                hintText: 'Ürün Açıklaması',
                controller: descController,
                validator: AppValidator.emptyValidator,
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.name],
                textInputAction: TextInputAction.next
              ),
              AppUI.verticalGap(2),
              AppFormField(
                hintText: 'Extra Ürün Adı',
                controller: extraController,
                keyboardType: TextInputType.text,
                autofillHints: const [AutofillHints.name],
                textInputAction: TextInputAction.next
              ),
              AppUI.verticalGap(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Ürün İçeriği Ekle', style: AppTextStyle.authText.copyWith(color: AppColor.iconColor)),
                  AppUI.horizontalGap(0.5),
                  AddButton(
                      function: () {
                        final TextEditingController newController = TextEditingController();
                        setState(() {
                          ingredientsController.add(newController);
                        });
                      })
                ],
              ),
              AppUI.verticalGap(),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ingredientsController.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: AppUI.pageVerticalPadding / 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: AppFormField(
                              hintText: 'Ürün içeriği ${index + 1}',
                              controller: ingredientsController[index],
                              keyboardType: TextInputType.text,
                              validator: AppValidator.emptyValidator,
                              autofillHints: const [AutofillHints.name],
                              textInputAction: TextInputAction.next,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                ingredientsController.remove(ingredientsController.elementAt(index));
                              });
                            },
                            child: Icon(Icons.delete, color: AppColor.red, size: 30.r)
                        )
                      ],
                    ),
                  );
                },
              ),
              AppUI.verticalGap(0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Ürün Boyutu Ekle', style: AppTextStyle.authText.copyWith(color: AppColor.iconColor)),
                  AppUI.horizontalGap(0.5),
                  AddButton(function: () {
                    final TextEditingController sizeController = TextEditingController();
                    final TextEditingController priceController = TextEditingController();
                    setState(() {
                      sizesController.add(sizeController);
                      pricesController.add(priceController);
                    });
                  })
                ],
              ),
              AppUI.verticalGap(),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: sizesController.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: AppUI.pageVerticalPadding / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: AppFormField(
                              hintText: 'Boyut ${index + 1}',
                              controller: sizesController[index],
                              keyboardType: TextInputType.text,
                              validator: AppValidator.emptyValidator,
                              autofillHints: const [AutofillHints.name],
                              textInputAction: TextInputAction.next
                          ),
                        ),
                        AppUI.horizontalGap(0.5),
                        Expanded(
                          child: AppFormField(
                              hintText: 'Ürün Fiyatı',
                              controller: pricesController[index],
                              keyboardType: TextInputType.number,
                              validator: AppValidator.emptyValidator,
                              autofillHints: const [AutofillHints.name],
                              textInputAction: TextInputAction.done
                          ),
                        ),
                        AppUI.horizontalGap(0.3),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                pricesController.remove(pricesController.elementAt(index));
                                sizesController.remove(sizesController.elementAt(index));
                              });
                            },
                            child: Icon(Icons.delete, color: AppColor.red, size: 30.r)
                        )
                      ],
                    ),
                  );
                },
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
              AppUI.verticalGap(2),
              SizedBox(
                height: 50.h,
                width: 250.w,
                child: LoadingButton(
                  backgroundColor: AppColor.buttonBG,
                  child: Text('Menüye Ekle',  style: AppTextStyle.bigButtonText.copyWith(color: AppColor.white)),
                  onTap: send,
                ),
              ),
              AppUI.verticalGap(2)
            ],
          ),
        ),
      ),
    );
  }
}