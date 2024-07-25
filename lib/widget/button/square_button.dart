import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/ui_const.dart';

class SquareButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final void Function() onTap;

  const SquareButton({super.key, required this.backgroundColor, required this.icon, required this.iconColor, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: backgroundColor
        ),
        padding: AppUI.pageFullSidePadding / 2,
        child: Center(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}