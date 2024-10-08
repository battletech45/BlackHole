import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/text_style.dart';

class AppFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool isBigField;
  final bool readOnly;
  final bool enabled;
  final String? helperText;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final InputBorder? border;
  final InputBorder? selectedBorder;
  final Iterable<String>? autofillHints;
  final TextCapitalization textCapitalization;
  const AppFormField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.onTap,
    this.obscureText = false,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.isBigField = false,
    this.readOnly = false,
    this.enabled = true,
    this.helperText,
    this.prefixIcon,
    this.onChanged,
    this.border,
    this.autofillHints,
    this.onFieldSubmitted,
    this.selectedBorder,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool isVisible;

  @override
  void initState() {
    isVisible = !widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      autofillHints: widget.autofillHints,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      obscureText: !isVisible,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      enabled: widget.enabled,
      autocorrect: true,
      enableIMEPersonalizedLearning: true,
      enableSuggestions: true,
      style: AppTextStyle.authText.copyWith(color: AppColor.iconColor),
      onFieldSubmitted: widget.onFieldSubmitted,
      textCapitalization: widget.textCapitalization,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start,
      maxLines: widget.isBigField ? 5 : 1,
      cursorColor: AppColor.hintTextColor,
      decoration: InputDecoration(
        fillColor: AppColor.cardBGDark,
        border: widget.border ?? OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: AppColor.hintTextColor, width: 1)
        ),
        enabledBorder: widget.border ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide(color: AppColor.hintTextColor, width: 1)
        ),
        focusedBorder: widget.selectedBorder ?? OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: AppColor.selectedBorderColor, width: 1)
        ),
        prefixIcon: widget.prefixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: widget.isBigField ? 12 : 0).r,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.smallButtonText.copyWith(color: AppColor.borderColor),
        helperText: widget.helperText,
        suffixIcon: widget.obscureText
            ? IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Icon(
            !isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColor.red,
          ),
        )
            : null,
        suffixIconColor: AppColor.hintTextColor,
      ),
    );
  }
}