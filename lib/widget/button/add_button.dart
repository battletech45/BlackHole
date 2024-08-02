import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/colors.dart';

class AddButton extends StatelessWidget {
  final void Function() function;

  const AddButton({super.key, required this.function});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: AppColor.buttonBG
        ),
        child: Center(child: Icon(Icons.add, color: AppColor.white)),
      ),
    );
  }
}