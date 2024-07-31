import 'package:black_hole/core/constant/text_style.dart';
import 'package:black_hole/core/constant/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constant/colors.dart';

class SizeTile extends StatefulWidget {
  final String size;
  final bool isSelected;

  const SizeTile({super.key, required this.size, required this.isSelected});

  @override
  State<SizeTile> createState() => _SizeTileState();
}

class _SizeTileState extends State<SizeTile> {
  String selectedSize = '';
  String selectedQuantity = '';
  int iconSize = 0;
  
  @override
  void initState() {
    super.initState();
    changeSize();
  }
  
  void changeSize() {
    if(widget.size.trim().toLowerCase() == 'küçük') {
      iconSize = 25;
      selectedSize = 'Küçük';
      selectedQuantity = '8 fl OZ';
    }
    else if(widget.size.trim().toLowerCase() == 'orta') {
      iconSize = 30;
      selectedSize = 'Orta';
      selectedQuantity = '12 fl OZ';
    }
    else if(widget.size.trim().toLowerCase() == 'büyük') {
      iconSize = 35;
      selectedSize = 'Büyük';
      selectedQuantity = '16 fl OZ';
    }
    else {
      iconSize = 40;
      selectedSize = 'Venti';
      selectedQuantity = '20 fl OZ';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(right: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.coffee, color: widget.isSelected ? AppColor.buttonBG : AppColor.white, size: iconSize.toDouble()),
          AppUI.verticalGap(0.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(selectedSize, style: AppTextStyle.sizeText),
              AppUI.horizontalGap(0.3),
              Text(selectedQuantity, style: AppTextStyle.sizeText.copyWith(color: AppColor.buttonBG))
            ],
          )
        ],
      ),
    );
  }
}