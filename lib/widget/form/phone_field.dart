import 'package:black_hole/core/constant/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/text_style.dart';
import '../../core/util/validator.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.onChanged, this.initialCountryCode = 'TR', this.initialValue});
  final void Function(PhoneNumber value) onChanged;
  final String initialCountryCode;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onChanged: onChanged,
      initialValue: initialValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: AppColor.hintTextColor, width: 1)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: AppColor.hintTextColor, width: 1)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: AppColor.selectedBorderColor, width: 1)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0).r,
        hintStyle: AppTextStyle.smallButtonText.copyWith(color: AppColor.iconColor),
      ),
      invalidNumberMessage: 'Geçersiz telefon numarası',
      initialCountryCode: initialCountryCode,
      keyboardType: TextInputType.phone,
      showDropdownIcon: false,
      flagsButtonMargin: AppUI.horizontal,
      languageCode: 'tr',
      style: AppTextStyle.smallButtonText.copyWith(color: AppColor.iconColor),
      validator: AppValidator.phoneNumberValidator,
      pickerDialogStyle: PickerDialogStyle(
        searchFieldInputDecoration: const InputDecoration(hintText: 'Ara..', contentPadding: EdgeInsets.symmetric(horizontal: AppUI.paddingValue)),
        backgroundColor: AppColor.iconColor,
        countryCodeStyle: Theme.of(context).textTheme.bodyMedium,
        countryNameStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
