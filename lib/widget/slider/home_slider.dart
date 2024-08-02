import 'package:black_hole/core/constant/ui_const.dart';
import 'package:black_hole/core/model/menu.dart';
import 'package:black_hole/widget/card/category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategorySlider extends StatefulWidget {
  late List<MenuItemModel>? data;

  HomeCategorySlider({super.key, required this.data});

  @override
  State<HomeCategorySlider> createState() => _HomeCategorySliderState();
}

class _HomeCategorySliderState extends State<HomeCategorySlider> {
  String selectedCategory = '';

  void changeCategory(String selectedNewCategory) {
    setState(() {
      selectedCategory = selectedNewCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.data?.length ?? 0,
          itemBuilder: (context, index) {
            return CategoryCard(
              title: widget.data?[index].title ?? '',
              imageURL: widget.data?[index].imageURL ?? '',
              isSelected: widget.data != null ? widget.data![index].title == selectedCategory : false,
              onTap: () => changeCategory(widget.data != null ? widget.data![index].title : '')
            );
          }
      ),
    );
  }
}